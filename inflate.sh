#!/bin/bash
echo "=== Симулируем годы активной локальной разработки ==="

echo "Компилируем локальные артефакты..."
GOOS=linux GOARCH=amd64 go build -o ./app_linux .
GOOS=windows GOARCH=amd64 go build -o ./app_windows.exe .
GOOS=darwin GOARCH=amd64 go build -o ./app_osx .

echo "Создаем тестовые фикстуры и логи..."
dd if=/dev/urandom of=local_test.db bs=1M count=90
dd if=/dev/urandom of=debug_development.log bs=1M count=80

mkdir -p assets/design
dd if=/dev/zero of=assets/design/landing_page_v1.psd bs=1M count=90
dd if=/dev/zero of=assets/design/presentation_heavy.pdf bs=1M count=90

echo "=== Готово! ==="