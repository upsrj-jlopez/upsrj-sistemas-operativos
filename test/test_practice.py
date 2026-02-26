import subprocess
import pytest
import os

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


def test_cron_lines(out_log):
    # Verifica que las tres líneas con CRON estén presentes en OUT_LOG
    expected = [
        "Feb 25 08:12:03 ubuntu-server CRON[1024]: (root) CMD (run-parts /etc/cron.hourly)",
        "Feb 25 08:19:01 ubuntu-server CRON[1120]: (root) CMD (backup.sh)",
        "Feb 25 08:29:55 ubuntu-server CRON[1400]: (root) CMD (logrotate /etc/logrotate.conf)"
    ]
    for line in expected:
        assert line in out_log


def test_systemd_lines(out_log):
    # Verifica que existan líneas con la palabra "systemd"
    assert any("systemd" in line for line in out_log)


def test_ssh_lines(out_log):
    # Verifica que existan líneas con la palabra "ssh"
    assert any("ssh" in line for line in out_log)


def test_sudo_count(out_log):
    # Verifica que el conteo de líneas con "sudo" sea exactamente 3
    count_line = [line for line in out_log if line.isdigit()]
    assert count_line and int(count_line[0]) == 3


def test_failed_password(out_log):
    # Verifica que las dos líneas de "Failed password" estén presentes
    expected = [
        "Feb 25 08:17:10 ubuntu-server sshd[2102]: Failed password for invalid user admin from 10.0.0.25 port 60211 ssh2",
        "Feb 25 08:26:45 ubuntu-server sshd[2305]: Failed password for root from 203.0.113.45 port 49821 ssh2"
    ]
    for line in expected:
        assert line in out_log


def test_ip_addresses(out_log):
    # Verifica que las direcciones IP aparezcan en OUT_LOG
    ips = ["192.168.1.50", "10.0.0.25", "172.16.0.8", "203.0.113.45"]
    for ip in ips:
        assert any(ip in line for line in out_log)


def test_usb_line(out_log):
    # Verifica que exista una línea con "usb"
    assert any("usb" in line for line in out_log)


def test_kernel_count(out_log):
    # Verifica que el conteo de líneas con "kernel" sea exactamente 2
    count_line = [line for line in out_log if line.isdigit()]
    assert count_line and int(count_line[-1]) == 2


def test_accepted_lines(out_log):
    # Verifica que existan líneas con "Accepted"
    assert any("Accepted" in line for line in out_log)


def test_networkmanager_warn(out_log):
    # Verifica que exista una línea con "<warn>"
    assert any("<warn>" in line for line in out_log)


def test_root_sorted(out_log):
    # Verifica que las líneas con "root" estén ordenadas alfabéticamente
    root_lines = [line for line in out_log if "root" in line]
    assert root_lines == sorted(root_lines)


def test_cron_and_logrotate(out_log):
    # Verifica que existan líneas con "CRON" y con "logrotate"
    assert any("CRON" in line for line in out_log)
    assert any("logrotate" in line for line in out_log)


def test_apt_count(out_log):
    # Verifica que el conteo de líneas con "apt" sea exactamente 3
    count_line = [line for line in out_log if line.isdigit()]
    assert count_line and int(count_line[0]) == 3


def test_sessions(out_log):
    # Verifica que existan líneas con "session opened" y "session closed"
    assert any("session opened" in line for line in out_log)
    assert any("session closed" in line for line in out_log)


def test_not_systemd(out_log):
    # Verifica que las líneas marcadas como NOT_SYSTEMD no contengan "systemd"
    assert all("systemd" not in line for line in out_log if "NOT_SYSTEMD" in line)


def test_ssh_ips(out_log):
    # Verifica que las direcciones IP de conexiones ssh aparezcan en OUT_LOG
    ips = ["192.168.1.50", "10.0.0.25", "172.16.0.8", "203.0.113.45"]
    for ip in ips:
        assert ip in " ".join(out_log)


def test_ports(out_log):
    # Verifica que los puertos usados en ssh aparezcan en OUT_LOG
    ports = ["53422", "60211", "42311", "49821"]
    for port in ports:
        assert port in " ".join(out_log)


def test_starting_and_started(out_log):
    # Verifica que existan líneas con "Starting" y con "Started"
    assert any("Starting" in line for line in out_log)
    assert any("Started" in line for line in out_log)


def test_stopping_and_stopped(out_log):
    # Verifica que existan líneas con "Stopping" y con "Stopped"
    assert any("Stopping" in line for line in out_log)
    assert any("Stopped" in line for line in out_log)


def test_sudo_success(out_log):
    # Verifica que existan líneas con "sudo" y un mensaje de éxito
    assert any("sudo" in line for line in out_log)
    assert any("Éxito" in line or "Success" in line for line in out_log)