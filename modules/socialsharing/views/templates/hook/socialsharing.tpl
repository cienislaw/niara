{if $PS_SC_TWITTER || $PS_SC_FACEBOOK || $PS_SC_PINTEREST}
	<p class="socialsharing_product hidden-print">
		{if $PS_SC_TWITTER}
			<button data-type="twitter" type="button" class="btn btn-xs btn-twitter">
				<i class="fab fa-twitter fa-fw"></i> {l s="Tweet" mod='socialsharing'}
			</button>
		{/if}
		{if $PS_SC_FACEBOOK}
			<button data-type="facebook" type="button" class="btn btn-xs btn-facebook">
				<i class="fab fa-facebook-f fa-fw"></i> {l s="Share" mod='socialsharing'}
			</button>
		{/if}
		{if $PS_SC_PINTEREST}
			<button data-type="pinterest" type="button" class="btn btn-xs btn-pinterest">
				<i class="fab fa-pinterest fa-fw"></i> {l s="Pinterest" mod='socialsharing'}
			</button>
		{/if}
	</p>
{/if}
