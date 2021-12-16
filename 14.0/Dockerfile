FROM odoo:14.0 AS odoogap14

USER root

RUN mkdir /mnt/oe \
    && mkdir -p /etc/odoogap \
    && mkdir -p /mnt/extra-addons \
    && apt-get update \
    && apt-get install -y --no-install-recommends git

COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoogap/

RUN chown -R odoo /mnt/oe \
    && chown -R odoo /etc/odoogap/ \
    && chown -R odoo /mnt/extra-addons

USER odoo



# passing the default for compose be able to change it to:
#    /etc/odoogap/odoo.conf
ENV ODOO_RC /etc/odoo/odoo.conf

CMD ["odoo"]