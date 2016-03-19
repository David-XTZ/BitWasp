            <div class="col-md-9">
                <h2>Public Keys</h2>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                <p align="justify">{lang('you_are_using_onchain_to')}</p>

                <div class="panel panel-default" id="bip32panel">
                    <div class="panel-heading" id="bip32panelheading">{lang('bip32_key_watch_only')}</div>
                    <textarea class="form-control" id="bip32key" name="bip32key" readonly>{$key.key|escape:"html":"UTF-8"}</textarea>

                </div>

                {$key_usage_html}
            </div>
