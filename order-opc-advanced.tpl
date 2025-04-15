{if $opc}
  {assign var="back_order_page" value="order-opc-advanced.php"}
{else}
  {assign var="back_order_page" value="order.php"}
{/if}

{if $PS_CATALOG_MODE}
  {capture name=path}{l s='Your shopping cart'}{/capture}
  <h2 id="cart_title">{l s='Your shopping cart'}</h2>
  <div class="alert alert-warning">{l s='Your new order was not accepted.'}</div>
{else}
  {if $productNumber}

    {include file="$tpl_dir./order-payment-advanced-new.tpl"}
    
    {include file="$tpl_dir./order-carrier.tpl"}
    {* {include file="$tpl_dir./order-carrier-advanced.tpl"} *}

    {if $is_logged AND !$is_guest}
      {include file="$tpl_dir./order-address-advanced.tpl"}
    {else}
      {include file="$tpl_dir./order-opc-new-account-advanced.tpl"}
    {/if}

    {if $conditions AND $cms_id}
      {if $override_tos_display }
        {$override_tos_display}
      {else}
        <div class="row">
          <div class="col-xs-12 col-md-12">
            <h2>{l s='Terms and Conditions'}</h2>
            <div class="box">
              <div class="checkbox">
                <label for="cgv">
                  <input type="checkbox" name="cgv" id="cgv" value="1" {if $checkedTOS}checked="checked"{/if}>
                  <span class="label-text">{l s='I agree to the terms of service and will adhere to them unconditionally.'}</span>
                </label>
                <a href="{$link_conditions|escape:'html':'UTF-8'}" class="iframe" rel="nofollow">{l s='(Read the Terms of Service)'}</a>
              </div>
            </div>
          </div>
        </div>
      {/if}
    {/if}
  
    {include file="$tpl_dir./shopping-cart-advanced.tpl"}
    
  {else}
    {capture name=path}{l s='Your shopping cart'}{/capture}
    <h2 class="page-heading">{l s='Your shopping cart'}</h2>
    {include file="$tpl_dir./errors.tpl"}
    <div class="alert alert-warning">{l s='Your shopping cart is empty.'}</div>
  {/if}
  {strip}
    {addJsDef imgDir=$img_dir}
    {addJsDef authenticationUrl=$link->getPageLink("authentication", true)|escape:'quotes':'UTF-8'}
    {addJsDef orderOpcUrl=$link->getPageLink("order-opc", true)|escape:'quotes':'UTF-8'}
    {addJsDef historyUrl=$link->getPageLink("history", true)|escape:'quotes':'UTF-8'}
    {addJsDef guestTrackingUrl=$link->getPageLink("guest-tracking", true)|escape:'quotes':'UTF-8'}
    {addJsDef addressUrl=$link->getPageLink("address", true, NULL, "back={$back_order_page}")|escape:'quotes':'UTF-8'}
    {addJsDef orderProcess='order-opc'}
    {addJsDef guestCheckoutEnabled=$PS_GUEST_CHECKOUT_ENABLED|intval}
    {addJsDef displayPrice=$priceDisplay}
    {addJsDef taxEnabled=$use_taxes}
    {addJsDef conditionEnabled=$conditions|intval}
    {addJsDef vat_management=$vat_management|intval}
    {addJsDef errorCarrier=$errorCarrier|@addcslashes:'\''}
    {addJsDef errorTOS=$errorTOS|@addcslashes:'\''}
    {addJsDef checkedCarrier=$checked|intval}
    {addJsDef addresses=array()}
    {addJsDef isVirtualCart=$isVirtualCart|intval}
    {addJsDef isPaymentStep=$isPaymentStep|intval}
    {addJsDefL name=txtWithTax}{l s='(tax incl.)' js=1}{/addJsDefL}
    {addJsDefL name=txtWithoutTax}{l s='(tax excl.)' js=1}{/addJsDefL}
    {addJsDefL name=txtHasBeenSelected}{l s='has been selected' js=1}{/addJsDefL}
    {addJsDefL name=txtNoCarrierIsSelected}{l s='No carrier has been selected' js=1}{/addJsDefL}
    {addJsDefL name=txtNoCarrierIsNeeded}{l s='No carrier is needed for this order' js=1}{/addJsDefL}
    {addJsDefL name=txtConditionsIsNotNeeded}{l s='You do not need to accept the Terms of Service for this order.' js=1}{/addJsDefL}
    {addJsDefL name=txtTOSIsAccepted}{l s='The service terms have been accepted' js=1}{/addJsDefL}
    {addJsDefL name=txtTOSIsNotAccepted}{l s='The service terms have not been accepted' js=1}{/addJsDefL}
    {addJsDefL name=txtThereis}{l s='There is' js=1}{/addJsDefL}
    {addJsDefL name=txtErrors}{l s='Error(s)' js=1}{/addJsDefL}
    {addJsDefL name=txtDeliveryAddress}{l s='Delivery address' js=1}{/addJsDefL}
    {addJsDefL name=txtInvoiceAddress}{l s='Invoice address' js=1}{/addJsDefL}
    {addJsDefL name=txtModifyMyAddress}{l s='Modify my address' js=1}{/addJsDefL}
    {addJsDefL name=txtInstantCheckout}{l s='Instant checkout' js=1}{/addJsDefL}
    {addJsDefL name=txtSelectAnAddressFirst}{l s='Please start by selecting an address.' js=1}{/addJsDefL}
    {addJsDefL name=txtFree}{l s='Free' js=1}{/addJsDefL}

    {capture}{if $back}&mod={$back|urlencode}{/if}{/capture}
    {capture name=addressUrl}{$link->getPageLink('address', true, NULL, 'back='|cat:$back_order_page|cat:'?step=1'|cat:$smarty.capture.default)|escape:'quotes':'UTF-8'}{/capture}
    {addJsDef addressUrl=$smarty.capture.addressUrl}
    {capture}{'&multi-shipping=1'|urlencode}{/capture}
    {addJsDef addressMultishippingUrl=$smarty.capture.addressUrl|cat:$smarty.capture.default}
    {capture name=addressUrlAdd}{$smarty.capture.addressUrl|cat:'&id_address='}{/capture}
    {addJsDef addressUrlAdd=$smarty.capture.addressUrlAdd}
    {addJsDef opc=$opc|boolval}
    {capture}<h3 class="page-subheading">{l s='Your billing address' js=1}</h3>{/capture}
    {addJsDefL name=titleInvoice}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
    {capture}<h3 class="page-subheading">{l s='Your delivery address' js=1}</h3>{/capture}
    {addJsDefL name=titleDelivery}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
    {capture}<a class="btn btn-success" href="{$smarty.capture.addressUrlAdd}" title="{l s='Update' js=1}"><span>{l s='Update' js=1} <i class="icon icon-chevron-right"></i></span></a>{/capture}
    {addJsDefL name=liUpdate}{$smarty.capture.default|@addcslashes:'\''}{/addJsDefL}
  {/strip}
{/if}
