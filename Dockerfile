# Используем официальный Python-образ
FROM python:3.12-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем всё приложение
COPY . .

# Открываем порт 8000
EXPOSE 8000

# Запускаем Uvicorn-сервер
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
