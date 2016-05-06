            {capture name='t_profile_url'}user/{$user.user_hash}{/capture}

            <div class="col-md-9" id="own-account">

                <div class="row">
                    <div class="col-md-12 btn-group">
                       <h2>{$user.user_name|escape}
                           <div class='pull-right'>
                               {url type="anchor" url="account/edit" text=lang("edit") attr='class="btn btn-default"'}
                               {if $request_emails == TRUE}
                                   {if $user.email_address == NULL}
                                       {url type="anchor" url="accounts/email" text="Set Email" attr='class="btn btn-default"'}
                                   {else}
                                       {url type="anchor" url="accounts/email" text="Update Email" attr='class="btn btn-default"'}
                                   {/if}
                               {/if}
                               {url type="anchor" url="accounts/password" text=lang("change_password") attr='class="btn btn-default"'}
                           </div>
                       </h2>
                    </div>
                </div>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}
                <div class="col-xs-12">&nbsp;</div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('profile_url')}</strong></div>
                    <div class="col-md-8">{url type="anchor" url=$smarty.capture.t_profile_url text="" attr=''}</div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('location')}</strong></div>
                    <div class="col-md-8">{$user.location_f}</div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('local_currency')}</strong></div>
                    <div class="col-md-8">{$user.currency.name} ({$user.currency.symbol})</div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('display_login_activity')}</strong></div>
                    <div class="col-md-8">{if $user.display_login_time == '1'}{lang('enabled')}{else}{lang('disabled')}{/if}</div>
                </div>


                <div class="row">&nbsp;</div>
                <legend>{lang('private_settings')} </legend>

                {if $request_emails == TRUE}
                <div class="row">
                    <div class="col-md-4"><strong>Email Address</strong></div>
                    <div class="col-md-8">{if $user.email_address == ''}none{else}{$user.email_address|escape:"html":"UTF-8"}{/if}</div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('forward_messages_to_email')}</strong></div>
                    <div class="col-md-8">{if $user.email_updates == TRUE AND (($user.email_address == '')==FALSE) }Enabled{else}Disabled{/if}</div>
                </div>
                {/if}

                {if $user.user_role !== 'Admin'}
                <div class="row">
                    <div class="col-md-4"><strong>{lang('bitcoin_public_keys')}</strong></div>
                    <div class="col-md-8">
                        {if $bip32 == FALSE}{lang('not_set_up')} - {url type="anchor" url="bip32" text=lang("do_so_now") attr=""}
                        {else}Provider: {$bip32.provider} - {url type="anchor" url="bip32" text="Settings" attr=""}
                        {/if}
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{if $user.user_role == 'Vendor'}{lang('payout')}{else}{lang('refund')}{/if} {lang('address')}</strong></div>
                    <div class="col-md-8">
                        {if is_array($payout)}
                            {$payout.address|escape:"html":"UTF-8"} - {url type="anchor" url="accounts/payout" text="Settings" attr=''}
                        {else}
                            {lang('not_set_up')} - {url type="anchor" url="accounts/payout" text=lang("do_so_now") attr=''}
                        {/if}
                    </div>
                </div>
                {/if}


                <div class="row">&nbsp;</div>
                <legend>{lang('security')}</legend>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('two_factor_authentication')}</strong></div>
                    <div class="col-md-8">
                        {if $two_factor_setting == TRUE}
                            {if $two_factor.totp == TRUE}
                                {lang('enabled_mobile_app')}
                            {else}
                                {lang('enabled_pgp')}
                            {/if}
                        {else}
                            {lang('disabled')}
                        {/if}

                        {url type="anchor" url="account/two_factor" text=lang("configure") attr=""}
                    </div>
                </div>


                {if isset($user.pgp.public_key) == TRUE}

                <div class="row">
                    <div class="col-md-4"><strong>PGP Fingerprint</strong></div>
                    <div class="col-md-8">{substr($user.pgp.fingerprint, 0, -8)}<b>{substr($user.pgp.fingerprint,-8)}</b></div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('force_pgp_messages')}</strong></div>
                    <div class="col-md-8">{if $user.force_pgp_messages == '1'}{lang("enabled")}{else}{lang('disabled')}{/if}</div>
                </div>

                <div class="row">
                    <div class="col-md-4"><strong>{lang('block_non_pgp_messages')}</strong></div>
                    <div class="col-md-8">{if $user.block_non_pgp == '1'}{lang('enabled')}{else}{lang('disabled')}{/if}</div>
                </div>
                {else}
                <div class="row">
                    <div class="col-md-4"><strong>{lang('pgp_features')}</strong></div>
                    <div class="col-md-8">{url type="anchor" url="pgp/add" text=lang("add_a_pgp_key") attr=""} {lang('to_enable_features_such_as')}</div>
                </div>
                {/if}

            </div>
