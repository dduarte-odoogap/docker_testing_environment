#!/bin/bash
docker image build -t odoogap:14.0 .
docker image tag odoogap:14.0 gcr.io/odoo-14-trial/odoogap:14.0
docker push gcr.io/odoo-14-trial/odoogap:14.0
