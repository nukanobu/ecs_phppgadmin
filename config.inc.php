<?php
$conf['servers'][0]['desc'] = 'PostgreSQL';
$conf['servers'][0]['host'] = getenv('PG_HOST');
$conf['servers'][0]['port'] = 5432;
$conf['servers'][0]['sslmode'] = 'allow';

// 日本語固定
$conf['default_lang'] = 'japanese';

$conf['autocomplete'] = true;
$conf['extra_login_security'] = false;

$conf['owned_only'] = false;
$conf['show_system'] = false;

