<?php
$conf['servers'][0]['desc'] = 'Writer';
$conf['servers'][0]['host'] = 'hoge-dev01-cluster-rds-aurora.cluster-cejpgcjvcccv.ap-northeast-1.rds.amazonaws.com';
$conf['servers'][0]['port'] = 5432;
$conf['servers'][0]['sslmode'] = 'allow';

$conf['servers'][1]['desc'] = 'PostgreSQL';
$conf['servers'][1]['host'] = 'hoge-dev01-cluster-rds-aurora.cluster-ro-cejpgcjvcccv.ap-northeast-1.rds.amazonaws.com';
$conf['servers'][1]['port'] = 5432;
$conf['servers'][1]['sslmode'] = 'allow';


// 日本語固定
$conf['default_lang'] = 'japanese';

$conf['autocomplete'] = true;
$conf['extra_login_security'] = false;

$conf['owned_only'] = false;
$conf['show_system'] = false;

