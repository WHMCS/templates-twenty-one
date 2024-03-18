<div class="container">
    <div class="row mt-2 mb-3">
        <div class="col-md-4 ml-1 text-center">
            <img src="{routePath('clientarea-sitejet-get-preview', $sitejetServices[0]->id)}"
                 onerror="this.src = whmcsBaseUrl + '/assets/img/sitejet/preview_placeholder.png';"
                 alt="Sitejet Preview"
                 onload="this.style.opacity = 1"
                 id="sitejetPromoImage"
                 class="img-fluid d-block"
                 style="min-height:130px; border: 1px solid #ddd; transition: opacity 0.2s ease-in-out; opacity: 0"
            />
        </div>
        <div class="col-md-6 d-flex justify-content-center justify-content-md-start mt-2 mt-md-0">
            <div>
                <div class="mb-2">{lang key='sitejetBuilder.chooseWebsite'}</div>
                <div class="d-flex" style="gap: 6px;min-width: 250px;">
                    <select id="sitejetServiceSelect" class="form-control">
                        {foreach $sitejetServices as $key => $service}
                            <option value="{$service->id}">{$service->domain}</option>
                        {/foreach}
                    </select>
                    <button class="btn btn-primary btn-custom-action d-block div-service-item"
                            id="sitejetSsoButton"
                            data-serviceid="{$sitejetServices[0]->id}"
                            data-identifier="sitejet"
                            data-active="true"
                            style="min-width: 140px;"
                    >
                        {lang key="sitejetBuilder.editWebsite"}
                    </button>
                </div>
                <div class="alert alert-danger mt-2" id="sitejetAlert"
                     style="display: none;">{lang key="errorButTryAgain"}</div>
            </div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function() {
        let sitejetPreviewImage = jQuery('#sitejetPromoImage');

        jQuery('#sitejetServiceSelect').on('change', function (e) {
            let serviceId = jQuery(e.target).val();

            if (serviceId) {
                jQuery('#sitejetSsoButton').data('serviceid', serviceId);

                // if this were to fail to load, the below onerror handler will fall back to a placeholder image
                sitejetPreviewImage.attr(
                    'src',
                    WHMCS.utils.getRouteUrl('/clientarea/sitejet/service/' + serviceId + '/preview')
                ).css('opacity', 0.3);

                sitejetPreviewImage.data('is-placeholder', false);
            }
        })

        sitejetPreviewImage.removeAttr('onerror').error(function() {
            if (!sitejetPreviewImage.data('is-placeholder')) {
                sitejetPreviewImage.attr(
                    'src',
                    whmcsBaseUrl + '/assets/img/sitejet/preview_placeholder.png'
                );

                sitejetPreviewImage.data('is-placeholder', true);
            }
        });
    });
</script>
