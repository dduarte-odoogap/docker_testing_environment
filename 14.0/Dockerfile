FROM odoo:14.0 AS odoogap14

USER root

RUN mkdir /mnt/oe \
    && mkdir -p /etc/odoogap \
    && apt-get update \
    && apt-get install -y --no-install-recommends git

COPY ./entrypoint.sh /
COPY ./requirements.txt /
COPY ./odoo.conf /etc/odoogap/
COPY ./mnt /mnt/extra-addons

RUN python3 -m pip install --no-cache-dir -r requirements.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN chown -R odoo /mnt/oe \
    && chown -R odoo /mnt/extra-addons \
    && chown -R odoo /etc/odoogap/

VOLUME ["/var/lib/odoo", "/mnt/extra-addons"]

USER odoo



# passing the default for compose be able to change it to:
#    /etc/odoogap/odoo.conf
ENV ODOO_RC /etc/odoo/odoo.conf

CMD ["odoo"]