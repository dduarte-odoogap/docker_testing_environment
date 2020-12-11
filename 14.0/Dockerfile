FROM odoo:14.0 AS odoogap14

LABEL OdooGAP <info@odoogap.com>
USER root
COPY odoo-server.conf /etc/odoo-server.conf
COPY ./entrypoint.sh /

RUN chown odoo /etc/odoo-server.conf

USER odoo
CMD ["odoo"]
