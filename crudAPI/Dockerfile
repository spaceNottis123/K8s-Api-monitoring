# Usar uma imagem base com Python
FROM python:3.9-slim

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar o código da aplicação para o diretório de trabalho
COPY . .

# Instalar as dependências, incluindo Flask e SQLAlchemy
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta que o Flask vai usar
EXPOSE 5000

# Comando para rodar o aplicativo Flask
CMD ["python", "main.py"]
