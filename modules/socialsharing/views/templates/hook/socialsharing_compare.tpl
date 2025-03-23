{if $PS_SC_TWITTER || $PS_SC_FACEBOOK || $PS_SC_PINTEREST}
  <div id="social-share-compare">
    <p>{l s="Share this comparison with your friends:" mod='socialsharing'}</p>
    <p class="socialsharing_product">
      {if $PS_SC_TWITTER}
        <button data-type="twitter" type="button" class="btn btn-xs btn-twitter">
          <i class="icon icon-twitter"></i> {l s="Tweet" mod='socialsharing'}
        </button>
      {/if}
      {if $PS_SC_FACEBOOK}
        <button data-type="facebook" type="button" class="btn btn-xs btn-facebook">
          <i class="icon icon-facebook"></i> {l s="Share" mod='socialsharing'}
        </button>
      {/if}
      {if $PS_SC_PINTEREST}
        <button data-type="pinterest" type="button" class="btn btn-xs btn-pinterest">
          <i class="icon icon-pinterest"></i> {l s="Pinterest" mod='socialsharing'}
        </button>
      {/if}
    </p>
  </div>
{/if}
