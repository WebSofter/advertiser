source /var/www/crm.wsofter.ru/public_html/advertiser/backend/env/bin/activate
python3 manage.py runsslserver  0.0.0.0:8000 --certificate /etc/letsencrypt/live/crm.wsofter.ru/cert.pem --key /etc/letsencrypt/live/crm.wsofter.ru/privkey.pem