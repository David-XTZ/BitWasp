
			<div class="col-md-9">
                <h2>{lang('two_factor_authentication')}</h2>

                <div class='well'>
                    {assign var="defaultMessage" value=""}
                    {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                    <div class='row'>
                        <div class='col-md-2'><strong>Current Setting</strong></div>
                        <div class='col-md-4'><u>{if $two_factor_setting == TRUE}Enabled{else}Disabled{/if}</u></div>
                    </div>
                    <hr />

                    <div class='row'>
                        <div class='col-md-6'>
                            <div class='col-xs-12'>
                                <strong>{lang('time_based_two_factor_tokens')}</strong>

                                {if $two_factor.totp == TRUE}
                                <div class="col-md-12">
                                    {lang('you_are_currently_using_time')}<br />
                                    {url type="anchor" url="account/disable_2fa" text="Click here to disable this!" attr='class="btn btn-danger"'}
                                </div>
                                {else}

                                {form method="open" action="account/two_factor" attr=['class'=>'form-horizontal','name' => 'totp_form']}
                                    <div class='row'>
                                        <p>{lang('time_based_two_factor_authentication')}:</p>
                                        <p>{lang('1_scan_the_qr_code')}</p>
                                        <div class='col-md-9 col-md-offset-3 col-xs-12'><img src='data:image/png;base64,{$qr}'></div>
                                        <div class='col-md-10 col-md-offset-2 col-xs-12'>Secret Key: {$secret}</div>
                                        <p>{lang('2_enter_the_generated_token')}:</p>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <label class="control-label col-xs-2" for="password"></label>
                                            <div class="col-xs-6">
                                                <input type='password' id='password' class="form-control" name='password' placeholder="Password" />
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="password"}</div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <label class="control-label col-xs-2" for="token"></label>
                                            <div class="col-xs-6">
                                                <input type='text' class="form-control" name='totp_token' value='' placeholder="Token" autocomplete="off" />
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="totp_token"}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-2" for="submit"></label>
                                        <div class="col-xs-5">
                                            <p align="center">
                                                <input type='submit' class='btn btn-primary' name='submit_totp_token' value='Setup' />
                                            </p>
                                        </div>
                                    </div>

                                </form>
                                {/if}
                            </div>
                        </div>

                        <div class='col-md-6'>
                            <div class='col-xs-12'>
                                {if isset($two_factor.pgp) == TRUE}
                                <strong>PGP {lang('two_factor_authentication')}</strong>

                                <div class='row'>
                                    {if $two_factor.pgp == TRUE}
                                        {lang('you_are_currently_using_pgp')} <br />
                                        {url type="anchor" url="account/disable_2fa" text="Click here to disable this!" attr='class="btn btn-danger"'}
                                    {else}
                                        <div class='col-md-12'>{lang('pgp_based_two_factor_challenges')}</div>
                                        <div class='col-md-12'>{url type="anchor" url="account/pgp_factor" text="Setup" attr='class="btn btn-default"'}</div>
                                    {/if}
                                </div>
                                {else}
                                <i>{lang('add_a_pgp_key_to')}</i>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>

            </div>