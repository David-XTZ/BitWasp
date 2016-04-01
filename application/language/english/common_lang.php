<?php
$lang['username'] = 'Username';
$lang['email_address'] = 'Email Address';
$lang['password'] = 'Password';
$lang['password_confirm'] = 'Password (confirm)';
$lang['message_pin'] = 'Message PIN';
$lang['role'] = 'Role';
$lang['buyer'] = 'Buyer';
$lang['vendor'] = 'Vendor';
$lang['location'] = 'Location';
$lang['registered'] = 'Registered';
$lang['last_activity'] = 'Last Activity';
$lang['average_rating'] = 'Average Rating';
$lang['completed_orders'] = 'Completed Orders';
$lang['recent_reviews'] = 'Recent Reviews';
$lang['all_reviews'] = 'All Reviews';
$lang['positive'] = 'Positive';
$lang['disputed'] = 'Disputed';
$lang['average'] = 'Average';
$lang['latest_listings'] = 'Latest Listings';
$lang['pgp_fingerprint'] = 'PGP Fingerprint';
$lang['pgp_public_key'] = 'PGP Public Key';


$lang['navbar/login'] = 'Login';
$lang['navbar/register'] = 'Register';
$lang['navbar/home'] = 'Home';
$lang['navbar/items'] = 'Items';
$lang['navbar/admin'] = 'Admin';
$lang['navbar/inbox'] = function($count_unread_messages){
    return 'Inbox'.($count_unread_messages ? ('('.$count_unread_messages.')'): '');
};
$lang['navbar/account'] = 'Account';
$lang['navbar/logout'] = 'Logout';

$lang['sidebar/orders'] = 'Orders';
$lang['sidebar/disputes'] = 'Disputes';
$lang['sidebar/my_listings'] = 'My Listings';
$lang['sidebar/my_purchases'] = 'Your Purchases';
$lang['sidebar/categories'] = 'Categories';
