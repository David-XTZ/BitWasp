
		    <div class="col-md-9" id="admin-trusted-user">
                <h3>{url type="anchor" url="admin/items" text="Back" attr='class="btn btn-default"'} {lang('trusted_user_settings')}</h3>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                <div class='row'>
                    <p align='justify'>{lang('this_form_allows_you_to')} </p>
                    <p align='justify'>{lang('to_ignore_a_particular_attribute')}</p>
                </div>


                {form method="open" action="admin/trusted_user" attr='class="form-horizontal"'}
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-3" for="trusted_user_rating">Required rating:</label>
                            <div class="col-xs-7">
                                <input type='text' class='form-control' id='trusted_user_rating' name='trusted_user_rating' value="{$config.trusted_user_rating|escape:"html":"UTF-8"}" />
                            </div>
                        </div>
                        <div class="col-xs-9 col-xs-offset-3">{form method="form_error" field="trusted_user_rating"}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-3" for="review_count">Review count:</label>
                            <div class="col-xs-7">
                                <input type='text' class='form-control' id='review_count' name='trusted_user_review_count' value="{$config.trusted_user_review_count|escape:"html":"UTF-8"}" />
                            </div>
                        </div>
                        <div class="col-xs-9 col-xs-offset-3">{form method="form_error" field='trusted_user_review_count'}</div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12">
                            <label class="control-label col-xs-3" for="completed_orders">{lang('minimum_complete_orders')}:</label>
                            <div class="col-xs-7">
                                <input type='text' class='form-control' id='completed_orders' name='trusted_user_order_count' value="{$config.trusted_user_order_count|escape:"html":"UTF-8"}" />
                            </div>
                        </div>
                        <div class="col-xs-9 col-xs-offset-3">{form method="form_error" field='trusted_user_order_count'}</div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-xs-2" for="submit"></label>
                        <div class="col-xs-5">
                            <p align="center">
                                <input type="submit" name='trusted_user_update' value="Update" class="btn btn-primary" />
                                {url type="anchor" url="admin/items" text="Cancel" attr='class="btn btn-default"'}
                            </p>
                        </div>
                    </div>
                </form>
            </div>