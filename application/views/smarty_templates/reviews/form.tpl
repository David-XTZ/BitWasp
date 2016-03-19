            <div class="col-md-9" id="review_form">
                <h2>Review Order #{$review_state.order_id}</h2>

                {assign var="defaultMessage" value=""}
                {returnMessage defaultMessage="$defaultMessage" returnMessage="$returnMessage" class="$returnMessage_class"}

                {if $review_state.review_type == 'buyer'}
                {capture name="t_vendor_url"}user/{$review_info.vendor.user_hash}{/capture}

                <div class="row">
                    <div class="col-xs-6">
                        <b>{lang('order_information')}</b>
                        <ul>
                            <li>{lang('this_order_was_with')} {url type="anchor" url=$smarty.capture.t_vendor_url text=$review_info.vendor.user_name|escape:"html":"UTF-8" attr=''}.</li>
                            <li>{if $review_info.vendor_selected_upfront == '1'}
                                Paid Up-front
                            {elseif $review_info.vendor_selected_escrow == '1'}
                                Escrow
                            {else}
                                Paid Up-front
                            {/if}</li>
                            <li>Paid for: {$review_info.paid_time_f}.</li>
                            <li>Dispatched: {$review_info.dispatched_time_f}.</li>
                            <li>Complete: {$review_info.finalized_time_f}.</li>
                            <li>{lang('order_cost_shipping')}: {$coin.symbol} {$review_info.order_price}</li>
                            <li>Site Fee's: {$coin.symbol} {$review_info.fees}</li>
                            {if $review_info.disputed == '1'}
                                <li>This order was <b>disputed</b> on {$review_info.disputed_time_f}</li>
                            {/if}
                        </ul>
                    </div>
                    <div class='col-xs-3'>
                        <b>Items</b>
                        <ul>
                        {foreach from=$review_info.items item=item}
                            <li>{$item.quantity|escape:"html":"UTF-8"} x {$item.name|escape:"html":"UTF-8"}</li>
                        {/foreach}
                        </ul>
                    </div>
                </div>

                {form method="open" action=$action_page attr='class="form-horizontal"'}
                    {form method="validation_errors"}
                    {form method="form_error" field="review_length"}
                    <div class='col-xs-12'>
                        <div class='well' style='background-color:white;'>
                            <h4>Vendor Feedback</h4>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="vendor_communication">Communication</label>
                                    <div class="col-xs-3">
                                        <select name="vendor_communication" id="vendor_communication" class="form-control">
                                            <option value=''></option>
                                            <option value='1'>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>
                                            <option value='5'>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="vendor_communication"}</div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="vendor_shipping">Shipping</label>
                                    <div class="col-xs-3">
                                        <select name='vendor_shipping' id="vendor_shipping" autocomplete='off' class='form-control'>
                                            <option value=''></option>
                                            <option value='1'>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>
                                            <option value='5'>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="vendor_shipping"}</div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="location">Comments</label>
                                    <div class="col-xs-7">
                                        <label class="radio-inline">
                                            <input type='radio' class='form-control' name='vendor_comments_source' value='prepared' /> {lang('use_prepared_feedback')}
                                        </label>

                                        <select name='vendor_prepared_comments' autocomplete='off' class='form-control'>
                                            <option value=''></option>
                                            <option value='{lang('excellent_vendor_would_do_business')}'>{lang('excellent_vendor_would_do_business')}</option>
                                            <option value='Slow delivery.'>{lang('poor_delivery_time')}</option>
                                            <option value='{lang('poor_communication')}'>{lang('poor_communication')}</option>
                                            <option value='{lang('poor_communication_slow_delivery')}'>{lang('poor_communication_slow_delivery')}</option>
                                            <option value='Fast delivery.'>Fast delivery.</option>
                                        </select>

                                        <label class="radio-inline">
                                            <input type='radio' class='form-control' name='vendor_comments_source' value='input' /> {lang('write_own_comment')}
                                        </label>

                                        <textarea class='form-control' name='vendor_free_comments'></textarea>

                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">
                                    {form method="form_error" field="vendor_comments_source"}
                                    {form method="form_error" field="vendor_prepared_comments"}
                                </div>
                            </div>
                        </div>


                        <div class='well' style='background:white;'>
                            <h4>{if count($review_info.items) > 1}
                                    <input type='radio' name='review_length' value='short' /> {lang('submit_short_feedback')}
                                {else}
                                    Item Feedback <input type='hidden' name='review_length' value='short' />
                                {/if}</h4>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="short_item_quality">Item Quality</label>
                                    <div class="col-xs-3">
                                        <select name='short_item_quality' autocomplete='off' class='form-control'>
                                            <option value=''></option>
                                            <option value='1'>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>
                                            <option value='5'>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="short_item_quality"}</div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="short_item_matches_desc">{lang('matches_description')}</label>
                                    <div class="col-xs-3">
                                        <select name='short_item_matches_desc' autocomplete='off' class='form-control'>
                                            <option value=''></option>
                                            <option value='1'>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>
                                            <option value='5'>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="short_item_matches_desc"}</div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <label class="control-label col-xs-2" for="short_item_comments_source">Comments</label>
                                    <div class="col-xs-7">
                                        <label class="radio-inline">
                                            <input type='radio' name='short_item_comments_source' class='form-control' value='prepared' /> {lang('use_prepared_statements')}
                                        </label>

                                        <select name='short_item_prepared_comments' autocomplete='off' class='form-control'>
                                            <option value=''></option>
                                            <option value='{lang('did_not_match_description')}'>{lang('did_not_match_description')}</option>
                                            <option value='Poor quality.'>Poor quality.</option>
                                            <option value='{lang('excellent_quality')}'>{lang('excellent_quality')}</option>
                                            <option value='{lang('would_purchase_again')}'>{lang('would_purchase_again')}</option>
                                        </select>

                                        <label class="radio-inline">
                                            <input type='radio' name='short_item_comments_source' class='form-control' value='input' /> {lang('write_own_comment')}
                                        </label>
                                        <textarea name='short_item_free_comments' class='form-control'></textarea>
                                    </div>
                                </div>
                                <div class="col-xs-10 col-xs-offset-2">
                                    {form method="form_error" field="short_item_comments_source"}
                                    {form method="form_error" field="short_item_prepared_comments"}
                                </div>
                            </div>

                        </div>

                        {if count($review_info.items) > 1}
                        <div class='well' style='background:white;'>
                            <h4><input type='radio' name='review_length' value='long' class='form-control' /> {lang('submit_long_review')}</h4>

                            {$c=0}
                            {foreach from=$review_info.items item=item}
                                <b>{($c+1)}: {$item.name|escape:"html":"UTF-8"}</b>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label class="control-label col-xs-2" for="item[{$c}[quality]">Quality</label>
                                        <div class="col-xs-5">
                                            <select name='item[{$c}][quality]' id='item[{$c}][quality]' autocomplete='off' class='form-control'>
                                                <option value=''></option>
                                                <option value='1'>1</option>
                                                <option value='2'>2</option>
                                                <option value='3'>3</option>
                                                <option value='4'>4</option>
                                                <option value='5'>5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-xs-offset-2">{capture name="t_item_q_field"}item[{$c}][quality]{/capture}
                                        {form method="form_error" field=$smarty.capture.t_item_q_field}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label class="control-label col-xs-2" for="item[{$c}][matches_desc]">{lang('matches_description')}</label>
                                        <div class="col-xs-5">
                                            <select name='item[{$c}][matches_desc]' autocomplete='off' class='form-control'>
                                                <option value=''></option>
                                                <option value='1'>1</option>
                                                <option value='2'>2</option>
                                                <option value='3'>3</option>
                                                <option value='4'>4</option>
                                                <option value='5'>5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-xs-offset-2">
                                        {capture name="t_item_m_field"}item[{$c}][matches_desc]{/capture}
                                        {form method="form_error" field=$smarty.capture.t_item_m_field}
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label class="control-label col-xs-2" for="location">Comments</label>
                                        <div class="col-xs-5">

                                            <label class="radio-inline">
                                                <input type='radio' class='form-control' name='item[{$c}{lang('comments_source')}' value='prepared' /> {lang('use_prepared_statements')}
                                            </label>
                                            <select name='item[{$c}{lang('prepared_comments')}' autocomplete='off' class='form-control'>
                                                <option value=''></option>
                                                <option value='{lang('did_not_match_description')}'>{lang('did_not_match_description')}</option>
                                                <option value='Poor quality.'>Poor quality.</option>
                                                <option value='{lang('excellent_quality')}'>{lang('excellent_quality')}</option>
                                                <option value='{lang('would_purchase_again')}'>{lang('would_purchase_again')}</option>
                                            </select>

                                            <label class="radio-inline">
                                                <input type='radio' class='form-control' name='item[{$c}{lang('comments_source')}' value='input' /> {lang('write_own_comment')} <br />
                                            </label>
                                            <textarea class='form-control' name='item[{$c}][free_comments]'></textarea>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-xs-offset-2">
                                        {capture name="t_item_cs_field"}item[{$c}{lang('comments_source')}{/capture}
                                        {capture name="t_item_ps_field"}item[{$c}{lang('prepared_comments')}{/capture}
                                        {form method="form_error" field=$smarty.capture.t_item_cs_field}
                                        {form method="form_error" field=$smarty.capture.t_item_ps_field}
                                    </div>
                                </div>

                                {capture name="t_item_cs_field"}item[{$c}{lang('comments_source')}{/capture}
                                {capture name="t_item_ps_field"}item[{$c}{lang('prepared_comments')}{/capture}
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label class="control-label col-xs-2" for="location">Comments</label>
                                        <div class="col-xs-5">

                                            <label class="radio-inline">
                                                <input type='radio' class='form-control' name='item[{$c}{lang('comments_source')}' value='prepared' /> {lang('use_prepared_statements')}
                                            </label>
                                            <select name='item[{$c}{lang('prepared_comments')}' autocomplete='off' class='form-control'>
                                                <option value=''></option>
                                                <option value='{lang('did_not_match_description')}'>{lang('did_not_match_description')}</option>
                                                <option value='Poor quality.'>Poor quality.</option>
                                                <option value='{lang('excellent_quality')}'>{lang('excellent_quality')}</option>
                                                <option value='{lang('would_purchase_again')}'>{lang('would_purchase_again')}</option>
                                            </select>

                                            <label class="radio-inline">
                                                <input type='radio' class='form-control' name='item[{$c}{lang('comments_source')}' value='input' /> {lang('write_own_comment')} <br />
                                            </label>
                                            <textarea class='form-control' name='item[{$c}][free_comments]'></textarea>
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-xs-offset-2">
                                        {form method="form_error" field=$smarty.capture.t_item_cs_field}
                                        {form method="form_error" field=$smarty.capture.t_item_ps_field}
                                    </div>
                                </div>

                                <br />
                                {$c++}
                            {/foreach}
                        </div>
                        {/if}
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2 col-lg-2 col-md-2" for="submit"></label>
                        <div class="col-sm-5 col-lg-5 col-md-5">
                            <p align="center">
                                <input type='submit' name='buyer_submit_review' value='Submit Review' class='btn btn-primary'/>
                                {url type="anchor" url=$cancel_page text="Cancel" attr='class="btn btn-default"'}
                            </p>
                        </div>
                    </div>

                </form>
                {elseif $review_state.review_type == 'vendor'}
                {capture name="t_buyer_url"}user/{$review_info.buyer.user_hash}{/capture}

                <div class='row'>
                    <div class='col-xs-6'>
                        <b>{lang('order_information')}</b>
                        <ul>
                            <li>{lang('this_order_was_made_by')} {url type="anchor" url=$smarty.capture.t_buyer_url text=$review_info.buyer.user_name attr=''}</li>
                            <li>
                                {if $review_info.vendor_selected_upfront == '1' OR $review_info.vendor_selected_escrow == '0'}
                                {lang('finalized_early')}</li>
                                    <li>Paid for: {$review_info.paid_time_f}.</li>
                                    <li>Dispatched: {$review_info.dispatched_time_f}.</li>
                                    <li>Completed: {$review_info.finalized_time_f}.</li>
                                {else}
                                Escrow Payment.</li>
                                    <li>Dispatched: {$review_info.dispatched_time_f}.</li>
                                    <li>Paid for: {$review_info.paid_time_f}.</li>
                                    <li>Completed: {$review_info.finalized_time_f}.</li>
                                {/if}
                            <li>{lang('order_cost_shipping')}: {$coin.symbol} {$review_info.price}</li>
                            <li>Site Fee's: {$coin.symbol} {$review_info.fees}</li>
                            {if $review_info.disputed == '1'}
                                <li>This order was <b>disputed</b> on {$review_info.disputed_time_f}</li>
                            {/if}
                        </ul>
                    </div>
                    <div class='col-xs-3'>
                        <b>Items</b>
                        <ul>
                            {foreach from=$review_info.items item=item}
                                <li>{$item.quantity|escape:"html":"UTF-8"} x {$item.name|escape:"html":"UTF-8"}</li>
                            {/foreach}
                        </ul>
                    </div>
                </div>

                {form method="open" action=$action_page attr='class="form-horizontal"'}
                    {form method="validation_errors"}
                    <div class='well' style='background-color:white;'>
                        <h4>Buyer Feedback</h4>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label class="control-label col-xs-2" for="buyer_communication">Communication</label>
                                <div class="col-xs-3">
                                    <select name='buyer_communication' autocomplete='off' class="form-control">
                                        <option value=''></option>
                                        <option value='1'>1</option>
                                        <option value='2'>2</option>
                                        <option value='3'>3</option>
                                        <option value='4'>4</option>
                                        <option value='5'>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="buyer_communication"}</div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label class="control-label col-xs-2" for="buyer_cooperation">Cooperation</label>
                                <div class="col-xs-3">
                                    <select name='buyer_cooperation' autocomplete='off' class="form-control">
                                        <option value=''></option>
                                        <option value='1'>1</option>
                                        <option value='2'>2</option>
                                        <option value='3'>3</option>
                                        <option value='4'>4</option>
                                        <option value='5'>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-10 col-xs-offset-2">{form method="form_error" field="buyer_cooperation"}</div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <label class="control-label col-xs-2" for="buyer_comments_source">Comments</label>
                                <div class="col-xs-5">
                                    <label class="radio-inline">
                                        <input type='radio' class='form-control' name='buyer_comments_source' value='prepared' /> {lang('use_prepared_statements')}
                                    </label>

                                    <select name='buyer_prepared_comments' class='form-control' autocomplete='off'>
                                        <option value=''></option>
                                        <option value='Fast payer.'>Fast payer.</option>
                                        <option value='{lang('would_do_business_again')}'>{lang('would_do_business_again')}</option>
                                        <option value='{lang('will_avoid_in_future')}'>{lang('will_avoid_in_future')}</option>
                                    </select>

                                    <label class="radio-inline">
                                        <input type='radio' name='buyer_comments_source' class='form-control' value='input' /> {lang('write_own_comment')}
                                    </label>
                                    <textarea name='buyer_free_comments' class='form-control'></textarea>
                                </div>
                            </div>
                            <div class="col-xs-10 col-xs-offset-2">
                                {form method="form_error" field="buyer_comments_source"}
                                {form method="form_error" field="buyer_prepared_comments"}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2 col-lg-2 col-md-2" for="submit"></label>
                        <div class="col-sm-5 col-lg-5 col-md-5">
                            <p align="center">
                                <input type='submit' name='vendor_submit_review' value='Submit Review' class='btn btn-primary'/>
                                {url type="anchor" url=$cancel_page text="Cancel" attr='class="btn btn-default"'}
                            </p>
                        </div>
                    </div>
                </form>
                {/if}
            </div>