# Use a imagem base do Zabbix Server
FROM zabbix/zabbix-server-pgsql:trunk-ubuntu

# Garanta que estamos usando o usuário root
USER root

# Ajuste as permissões do diretório /var/lib/apt/lists/partial
RUN mkdir -p /var/lib/apt/lists/partial \
    && chmod 755 /var/lib/apt/lists/partial

# Instale o net-snmp e as dependências necessárias
RUN apt-get update && \
    apt-get install -y snmp snmpd vim telnet && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verifique se os comandos SNMP estão instalados corretamente
# RUN which snmpwalk && which snmpget && which snmpbulkwalk

# RUN echo 'root:emer888#' | chpasswd


# Copie a configuração do SNMP para o contêiner
# COPY snmpd.conf /etc/snmp/snmpd.conf

# Inicie o serviço SNMP ao iniciar o contêiner
# CMD ["snmpd", "-f", "-Lo", "-c", "/etc/snmp/snmpd.conf"]

# Retorne ao usuário padrão definido pela imagem base (se necessário)
# USER zabbix
