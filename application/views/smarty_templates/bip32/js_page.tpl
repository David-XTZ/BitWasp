            <div class="col-md-9">
                <h2>Public Key</h2>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                <p align="justify">{lang('you_are_currently_using_password')}</p>

                <div class="panel panel-default" id="bip32panel">
                    <div class="panel-heading" id="bip32panelheading">{lang('bip32_key_watch_only')}</div>
                    <textarea class="form-control" id="bip32key" name="bip32key" readonly>{$key.key}</textarea>
                    <div class="panel-body" id="panel_body">
                        <p>{lang('if_you_wish_to_generate')}</p>

                        <input type="hidden" name="wallet_salt" id="wallet_salt" value="{$wallet_salt}" />
                        <input type="hidden" name="extended_public_key" id="extended_public_key" value="{$key.key|escape:"html":"UTF-8"}" />
                        <div class="form-group">
                            <label class="control-label col-xs-12 col-md-3">{lang('wallet_passphrase')}</label>
                            <div class="col-xs-12 col-md-7">
                                <input type="password" class="form-control" name="wallet_passphrase" id="wallet_passphrase" value="" />
                            </div>
                            <div class="col-xs-12 col-md-1">
                                <button type="button" class="btn btn-primary" onclick="get_master_key()">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>

                {$key_usage_html}
            </div>