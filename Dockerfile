# Use a imagem base do Zabbix Server
FROM zabbix/zabbix-server-pgsql:trunk-ubuntu

# Garanta que estamos usando o usuário root
USER root

# Ajuste as permissões do diretório /var/lib/apt/lists/partial
RUN mkdir -p /var/lib/apt/lists/partial \
    && chmod 755 /var/lib/apt/lists/partial

# Instale o SNMP e as dependências necessárias
RUN apt-get update && \
    apt-get install -y snmp snmpd vim telnet && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Retorne ao usuário padrão definido pela imagem base (se necessário)
# USER zabbix
