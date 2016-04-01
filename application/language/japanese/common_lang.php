<?php
$lang['username'] = 'ユーザー名';
$lang['email_address'] = '電子メールアドレス';
$lang['password'] = 'パスワード';
$lang['password_confirm'] = 'パスワード（確認）';
$lang['message_pin'] = 'メッセージPIN';
$lang['role'] = '役割';
$lang['buyer'] = '買い手';
$lang['vendor'] = 'ベンダー';
$lang['location'] = 'ロケーション';
$lang['registered'] = '登録されました';
$lang['last_activity'] = '最後の活動';
$lang['average_rating'] = '平均格付け';
$lang['completed_orders'] = '完了した注文';
$lang['recent_reviews'] = '最近のレビュー';
$lang['all_reviews'] = 'すべてのレビュー';
$lang['positive'] = 'ポジティブ';
$lang['disputed'] = '係争中の';
$lang['average'] = '平均';
$lang['latest_listings'] = '最新リスト';
$lang['pgp_fingerprint'] = 'PGP指紋';
$lang['pgp_public_key'] = 'PGP公開鍵';


$lang['navbar/login'] = 'ログイン';
$lang['navbar/register'] = '登録';
$lang['navbar/home'] = 'ホーム';
$lang['navbar/items'] = 'アイテム';
$lang['navbar/admin'] = '管理者';
$lang['navbar/inbox'] = function($count_unread_messages){
    return '受信箱'.($count_unread_messages ? ('('.$count_unread_messages.')'): '');
};
$lang['navbar/account'] = 'アカウント';
$lang['navbar/logout'] = 'ログアウト';

$lang['sidebar/orders'] = '注文';
$lang['sidebar/disputes'] = '紛争';
$lang['sidebar/my_listings'] = '出品一覧';
$lang['sidebar/my_purchases'] = '購入一覧';
$lang['sidebar/categories'] = 'カテゴリー';
