import subprocess
import pytest
import os
import re

ROOT_DIR   = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SRC_DIR    = os.path.join(ROOT_DIR, "src")
SRC_DATA   = os.path.join(SRC_DIR, "syslog")
SRC_SCRIPT = os.path.join(SRC_DIR, "practice.sh")

OUT_DIR    = os.path.join(ROOT_DIR, "out")
OUT_LOG    = os.path.join(OUT_DIR, "practice.log")

@pytest.fixture(scope="session", autouse=True)
def run_practice_script():
    """
    Ejecuta el script practice.sh antes de correr los tests.
    Se asegura de que OUT_LOG se genere en ../out/practice.log.
    """
    result = subprocess.run(
        ["bash", SRC_SCRIPT],
        capture_output=True,
        text=True
    )
    # Si el script falla, pytest lo marcará inmediatamente
    assert result.returncode == 0, f"Error al ejecutar {SRC_SCRIPT}: {result.stderr}"


@pytest.fixture
def out_log():
    """
    Fixture que lee el archivo OUT_LOG definido en el script.
    OUT_LOG = ../out/practice.log
    Devuelve las líneas como lista para que cada test las valide.
    """

    with open(OUT_LOG, "r", encoding="utf-8") as file:
        return file.read().splitlines()


@pytest.fixture
def src_data():
    """
    Fixture que lee el archivo SRC_DATA definido en el script.
    SRC_DATA = ../src/syslog
    Devuelve las líneas como lista para que cada test las valide.
    """

    with open(SRC_DATA, "r", encoding="utf-8") as file:
        return file.read().splitlines()


def contains_expected_block(out_log, expected):
    """
    Busca si el bloque 'expected' aparece en 'out_log' de forma consecutiva.
    Recorre todas las posiciones donde aparece expected[0] y valida el bloque.
    """
    for i, line in enumerate(out_log):
        if line == expected[0]:
            candidate_block = out_log[i:i + len(expected)]
            if candidate_block == expected:
                return True
    return False


def contains_expected_block(out_log, expected):
    # Convertimos todo a string para evitar problemas de tipo
    out_log_str = [str(line).strip() for line in out_log]
    expected_str = [str(line).strip() for line in expected]

    # Caso especial: expected es un único número
    if len(expected_str) == 1 and expected_str[0].isdigit():
        return expected_str[0] in out_log_str

    # Caso general: bloque consecutivo
    for i, line in enumerate(out_log_str):
        if line == expected_str[0]:
            candidate_block = out_log_str[i:i + len(expected_str)]
            if candidate_block == expected_str:
                return True
    return False


def format_block(block, title="Bloque"):
    if not block:
        return f"{title}: <vacío>"
    return f"{title}:\n" + "\n".join(block)


@pytest.mark.parametrize("builder", [
    pytest.param(lambda src: [line for line in src if "CRON" in line],                                                              id="case_1"),
    pytest.param(lambda src: [line for line in src if "systemd" in line],                                                           id="case_2"),
    pytest.param(lambda src: [line for line in src if "ssh" in line],                                                               id="case_3"),
    pytest.param(lambda src: [str(len([line for line in src if "sudo" in line]))],                                                  id="case_4"),
    pytest.param(lambda src: [line for line in src if "Failed password" in line],                                                   id="case_5"),
    pytest.param(lambda src: [line for line in src if re.search(r"\b\d{1,3}(?:\.\d{1,3}){3}\b", line)],                             id="case_6"),
    pytest.param(lambda src: [line for line in src if "usb" in line],                                                               id="case_7"),
    pytest.param(lambda src: [str(len([line for line in src if "kernel" in line]))],                                                id="case_8"),
    pytest.param(lambda src: [line for line in src if "Accepted" in line],                                                          id="case_9"),
    pytest.param(lambda src: [line for line in src if "NetworkManager" in line and "<warn>" in line],                               id="case_10"),
    pytest.param(lambda src: sorted([line for line in src if "root" in line]),                                                      id="case_11"),
    pytest.param(lambda src: [line for line in src if "CRON" in line] + [line for line in src if "logrotate" in line],              id="case_12"),
    pytest.param(lambda src: [str(len([line for line in src if "apt" in line]))],                                                   id="case_13"),
    pytest.param(lambda src: [line for line in src if "session opened" in line or "session closed" in line],                        id="case_14"),
    pytest.param(lambda src: [line for line in src if "systemd" not in line],                                                       id="case_15"),
    pytest.param(lambda src: [part for line in src if "ssh" in line for part in line.split() if part.count(".") == 3],              id="case_16"),
    pytest.param(lambda src: [str(len(set([part for line in src if "port" in line for part in line.split() if part.isdigit()])))],  id="case_17"),
    pytest.param(lambda src: [line for line in src if "Starting" in line] + [line for line in src if "Started" in line],            id="case_18"),
    pytest.param(lambda src: [line for line in src if "Stopping" in line or "Stopped" in line],                                     id="case_19"),
    pytest.param(lambda src: ["Éxito: se encontró 'sudo'"],                                                                         id="case_20"),
])
def test_patterns(src_data, out_log, builder, request):
    expected = builder(src_data)
    assert contains_expected_block(out_log, expected), (
        f"Fallo en {request.node.callspec.id}\n\n"
        f"{format_block(expected, 'Esperado')}\n\n"
        f"{format_block(out_log, 'Actual')}"
    )


