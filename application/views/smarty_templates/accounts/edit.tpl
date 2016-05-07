            <div class="col-md-9" id="edit-account">
                <h2>{lang('edit_account')}</h2>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                {form method="open" action="account/edit" attr=['class'=>'form-horizontal']}
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="location">{lang('location')}</label>
                            <div class="col-xs-6">
                                {$location_select}
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">{form method="form_error" field="location"}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="local_currency">{lang('local_currency')}</label>
                            <div class="col-xs-6">
                                <select name="local_currency" class="form-control" id="local_currency" >
                                {foreach from=$currencies item=currency}
                                    <option value="{$currency.id}"{if $currency.id == $user.local_currency} selected="selected"{/if} >{$currency.name} ({$currency.symbol})</option>
                                {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">{form method="form_error" field="local_currency"}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="display_login_time">{lang("display_login_activity")}</label>
                            <div class="col-xs-6">
                                <label class="radio-inline">
                                    <input type='radio' class="radio" name='display_login_time' value='0' {if $user.display_login_time == '0'}checked{/if} /> {lang("disabled")}
                                </label>

                                <label class="radio-inline">
                                    <input type='radio' class="radio" name='display_login_time' value='1' {if $user.display_login_time == '1'}checked{/if} /> {lang("enabled")}
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">{form method="form_error" field="display_login_time"}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="email_updates">{lang('forward_messages_to_email')}</label>
                            <div class="col-xs-6">
                                <label class="radio-inline">
                                    <input type='radio' class="radio" name='email_updates' value='0' {if $user.email_updates == '0'}checked{/if} /> {lang("disabled")}
                                </label>

                                <label class="radio-inline">
                                    <input type='radio' class="radio" name='email_updates' value='1' {if $user.email_updates == '1'}checked{/if} /> {lang("enabled")}
                                </label>
                            </div>
                        </div>
                    </div>

                    {if isset($user.pgp) == TRUE}
                    <div class="form-group">
                        <label class="control-label col-xs-4" for="pgp_key">{lang('pgp_fingerprint')}</label>
                        <div class="col-xs-5">
                            <label class="control-label">{$user.pgp.fingerprint}</label>
                        </div>
                        <div class="col-xs-2">
                            {if $option_replace_pgp == TRUE}
                                {url type="anchor" url="pgp/replace" text="Replace" attr='class="btn btn-danger"'}
                            {else}
                                {url type="anchor" url="pgp/delete" text="Delete" attr='class="btn btn-danger"'}
                            {/if}
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="force_pgp_messages">{lang('force_pgp_messages')}</label>
                            <div class="col-xs-6">
                                <label class="radio-inline">
                                    <input type='radio' name='force_pgp_messages' value='0' {if $user.force_pgp_messages == '0'}checked{/if} /> {lang("disabled")}
                                </label>

                                <label class="radio-inline">
                                    <input type='radio' name='force_pgp_messages' value='1' {if $user.force_pgp_messages == '1'}checked{/if} /> {lang("enabled")}
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">{form method="form_error" field="force_pgp_messages"}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-4" for="block_non_pgp">{lang('block_non_pgp_messages')}</label>
                            <div class="col-xs-8">

                                <label class="radio-inline">
                                    <input type='radio' name='block_non_pgp' value='0' {if $user.block_non_pgp == '0'}checked{/if} /> {lang("disabled")}
                                </label>

                                <label class="radio-inline">
                                    <input type='radio' name='block_non_pgp' value='1' {if $user.block_non_pgp == '1'}checked{/if} /> {lang("enabled")}
                                </label>
                            </div>
                        </div>
                        <div class="col-xs-8 col-xs-offset-4">{form method="form_error" field="block_non_pgp"}</div>
                    </div>
                    {else}
                    <div class="form-group">
                        <label class="control-label col-xs-4" for="pgp">{lang('pgp_features')}</label>
                        <div class="col-xs-8">
                            {url type="anchor" url="pgp/add" text=lang("add_a_pgp_key") attr=''} {lang('to_enable_features_such_as')}
                        </div>
                    </div>
                    {/if}

                    <div class="form-group">
                        <label class="control-label col-xs-2" for="submit"></label>
                        <div class="col-xs-5">
                            <p align="center">
                                <input type='submit' value="{lang('update')}" class='btn btn-primary' />
                                {url type="anchor" url="account" text=lang("cancel") attr='class="btn btn-default"'}
                            </p>
                        </div>
                    </div>

                </form>
            </div>
