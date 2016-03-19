            <div class="col-md-9">
                <h2>Setup Keys</h2>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                <p align="justify">{lang('in_order_to_create_your')}</p>
                <ul>
                    <!--<li>{lang('using_onchain_io_s_transaction')} (Android)</li>-->
                    <li>{lang('using_an_external_wallet')}</li>
                    <li>{lang('by_entering_a_password_on')}</li>
                </ul>
                <br />

                {form method="open" action="bip32" attr=['class'=>'form-horizontal', 'name' => 'bip32Javascript', 'id' => 'bip32Javascript']}
                    <legend>{lang('create_a_key_from_a')}</legend>
                    {lang('you_can_create_a_key')}
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-3" for="wallet_passphrase">Wallet passphrase:</label>
                            <div class="col-xs-7">
                                <input type="password" class="form-control" name="wallet_passphrase" id="wallet_passphrase" value="" />
                            </div>
                            <div class="col-xs-2">
                                <input type="submit" name="js_submit" value="Submit" class="btn btn-primary" onclick="generate_key()"/>
                            </div>
                        </div>
                        <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="manual_public_key"}</div>
                        <input type="hidden" name="wallet_salt" id="wallet_salt" value="{$wallet_salt}" />
                    </div>
                </form>
                <div class="col-xs-12">&nbsp;</div>
<!--
                {form method="open" action="bip32" attr=['class'=>'form-horizontal', 'name' => 'authorizeForm']}
                    <legend>{lang('using_onchain_io_s_transaction')}</legend>
                    <div class="row">
                        <div class="col-xs-9">
                            <p align="justify">{lang('onchain_io_is_a_multi')}</p>
                            <p align="justify">{lang('download_the_onchain_io_transaction')}</p>
                        </div>
                        <div class="col-xs-3">
                            {if $display_onchain_qr == TRUE}
                            <img src='data:image/png;base64,{$onchain_mpk.qr}' style="width:100%">
                            {/if}
                        </div>
                    </div>
                </form>
                <div class="col-xs-12">&nbsp;</div>
-->
                {form method="open" action="bip32" attr=['class'=>'form-horizontal', 'name' => 'authorizeForm']}
                    <legend>{lang('using_an_external_wallet')}</legend>
                    <p align="justify">{lang('using_an_external_wallet')} is only recommended for advanced users, because most wallets don't support BIP32 yet. You can create BIP32 master keys on websites like {url type="anchor" url="http://bip32.org/" text="BIP32.org" attr='title="BIP32.org"'}{lang('and_importing_the_necessary_private')}</p>
                    <p align="justify">{lang('the_bip32_website_can_be')}</p>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-3" for="manual_public_key">{lang('extended_public_key')}:</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" name="manual_public_key" value="" />
                            </div>
                            <div class="col-xs-2">
                                <input type="submit" name="manual_submit" value="Submit" class="btn btn-primary"/>
                            </div>
                        </div>
                        <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="manual_public_key"}</div>
                    </div>

                </form>
            </div>