#!/bin/bash
###############################################################################
# File: test_file_practice.sh
# Purpose: Linear automated tester for File Management Practice
###############################################################################

source ./config.sh
source ./utils.sh

echo "Running $HEADER Tester (Linear Mode)"
echo "------------------------------------------------------------"

###############################################################################
# Validaciones iniciales
###############################################################################
check_project_structure
check_header_and_author "$OUT_LOG" "$HEADER"
check_script_execution "$SRC_DIR" "$SRC_FILE"
check_log_and_sections "$OUT_LOG" SECTIONS[@]

###############################################################################
# Generar test cases a partir de SECTIONS
###############################################################################
i=1
for section in "${SECTIONS[@]}"; do

    description=$(echo "$section" | cut -d':' -f2- | xargs | tr '[:upper:]' '[:lower:]')
    test_case_header "$i" "$description"

    case $i in
        1)
            #######################################################################
            # Validaciones de File Creation
            #######################################################################
            entries=$(grep $OUT_FILE $OUT_LOG | wc -l)
            if [ "$entries" -lt 2 ]; then
                fail "Log does not contain two metadata entries for practice.txt"
            fi
            pass "Two metadata entries found in log"

            first_ts=$(grep $OUT_FILE $OUT_LOG | head -n1 | awk '{print $6,$7,$8}')
            second_ts=$(grep $OUT_FILE $OUT_LOG | tail -n1 | awk '{print $6,$7,$8}')

            if [ "$first_ts" = "$second_ts" ]; then
                fail "Timestamps did not change after second touch"
            else
                pass "Timestamps updated correctly after second touch"
            fi
            ;;
        2)
            #######################################################################
            # Validaciones de File Editing
            #######################################################################
            # Validar que practice.txt tenga contenido
            size=$(stat -c%s "$OUT_FILE")
            if [ "$size" -eq 0 ]; then
                fail "${OUT_FILE} is still empty, no content added"
            else
                pass "${OUT_FILE} contains content (edited successfully)"
            fi

            # Validar que el log mencione algún editor
            if grep -qiE "vi|vim|nano" "$OUT_LOG"; then
                pass "Log mentions an editor used"
            else
                fail "No editor reference found in log"
            fi
            ;;
        3)
            #######################################################################
            # Validaciones de File Descriptors
            #######################################################################
            # Buscar patrón de stdout redirection
            if grep -qE "1>|1>>" "$SRC_FILE"; then
                pass "Stdout redirection found in script"
            else
                fail "No stdout redirection pattern found in script"
            fi

            # Buscar patrón de stderr redirection
            if grep -qE "2>|2>>" "$SRC_FILE"; then
                pass "Stderr redirection found in script"
            else
                fail "No stderr redirection pattern found in script"
            fi

            # Buscar patrón de stdin redirection
            if grep -q "<" "$SRC_FILE"; then
                pass "Stdin redirection found in script"
            else
                fail "No stdin redirection pattern found in script"
            fi
            ;;
        4)
            #######################################################################
            # Validaciones de File Permissions
            #######################################################################
            # Verificar permisos finales: owner rw, group r, others none (mask 640)
            perm=$(stat -c "%a" "$OUT_FILE")
            if [ "$perm" -eq 640 ]; then
                pass "${OUT_FILE} permissions correctly set to 640"
            else
                fail "${OUT_FILE} permissions incorrect (expected 640, got $perm)"
            fi
            ;;
    esac

    test_case_pass "$i" "$description"
    i=$((i+1))
done

###############################################################################
# Validacion final
###############################################################################
finalize_checks