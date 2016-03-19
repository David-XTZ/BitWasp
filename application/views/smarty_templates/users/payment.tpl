		<div class="col-md-9">
			<h2>Welcome {$user.user_name|escape:"html":"UTF-8"}!</h2>

            {assign var="defaultMessage" value=""}
            {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

            {lang('please_pay_an_entry_fee')} {$entry_payment.bitcoin_address}.<br /><br />
			
			{lang('so_far_you_have_paid')} {$coin.symbol} {$paid} of the {$coin.symbol} {$entry_payment.amount} {lang('fee_once_the_full_amount')}
			  
        </div>
