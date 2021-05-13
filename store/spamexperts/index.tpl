<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page bg-white mail-services">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.emailServices.headline"}</h2>
            <h3>{lang key="store.emailServices.tagline"}</h3>
        </div>
    </div>

    <nav class="navbar navbar-light bg-light navbar-expand-md p-0">
      <div class="container">
        <span class="navbar-brand"></span>
        <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#nav-landing-page" aria-expanded="false">
          <span class="sr-only">{lang key="toggleNav"}</span>
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav-landing-page">
          <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#overview');return false">{lang key="store.emailServices.tab.overview"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#howitworks');return false">{lang key="store.emailServices.tab.howitworks"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#pricing');return false">{lang key="store.emailServices.tab.pricing"}</a></li>
            <li class="nav-item"><a class="nav-link" href="#" onclick="smoothScroll('#faq');return false">{lang key="store.emailServices.tab.faq"}</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="product-options" id="overview">
        <div class="container">
            {if $numberOfFeaturedProducts > 0}
                <div class="row">
                    {if $products.incoming}
                        <div class="{if $numberOfFeaturedProducts == 1}col-md-6 offset-md-3{elseif $numberOfFeaturedProducts == 2}col-md-6{else}col-md-6 col-lg-4{/if}">
                            <div class="item">
                                <h4>{lang key="store.emailServices.incoming.title"}</h4>
                                <div class="icon">
                                    <i class="far fa-envelope-open"></i>
                                </div>
                                <span>{lang key="store.emailServices.overview.incoming.tagline"}</span>
                                <p>{lang key="store.emailServices.overview.incoming.headline"}</p>
                                {if $products.incoming->pricing()->best()}
                                    <div class="price">{lang key="from"} {$products.incoming->pricing()->best()->toFullString()}/{lang key="store.emailServices.domain"}</div>
                                {elseif $inPreview}
                                    <div class="price">-</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="incoming">
                                    {lang key="store.emailServices.overview.learn"}
                                </a>
                                <a href="#" class="btn btn-buy" data-target="incoming">
                                    {lang key="store.emailServices.overview.buy"}
                                </a>
                            </div>
                        </div>
                    {/if}
                    {if $products.outgoing}
                        <div class="{if $numberOfFeaturedProducts == 1}col-md-6 offset-md-3{elseif $numberOfFeaturedProducts == 2}col-md-6{else}col-md-6 col-lg-4{/if}">
                            <div class="item">
                                <h4>{lang key="store.emailServices.outgoing.title"}</h4>
                                <div class="icon">
                                    <i class="fas fa-envelope-open"></i>
                                </div>
                                <span>{lang key="store.emailServices.overview.outgoing.tagline"}</span>
                                <p>{lang key="store.emailServices.overview.outgoing.headline"}</p>
                                {if $products.outgoing->pricing()->best()}
                                    <div class="price">{lang key="from"} {$products.outgoing->pricing()->best()->toFullString()}/{lang key="store.emailServices.domain"}</div>
                                {elseif $inPreview}
                                    <div class="price">-</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="outgoing">
                                    {lang key="store.emailServices.overview.learn"}
                                </a>
                                <a href="#" class="btn btn-buy" data-target="outgoing">
                                    {lang key="store.emailServices.overview.buy"}
                                </a>
                            </div>
                        </div>
                    {/if}
                    {if $products.incomingarchiving || $products.outgoingarchiving || $products.incomingoutgoingarchiving}
                        <div class="{if $numberOfFeaturedProducts == 1}col-md-6 offset-md-3{elseif $numberOfFeaturedProducts == 2}col-md-6{else}col-md-6 offset-md-3 offset-lg-0 col-lg-4{/if}">
                            <div class="item">
                                <h4>{lang key="store.emailServices.archiving.title"}</h4>
                                <div class="icon">
                                    <i class="fas fa-cube"></i>
                                </div>
                                <span>{lang key="store.emailServices.overview.archiving.tagline"}</span>
                                <p>{lang key="store.emailServices.overview.archiving.headline"}</p>
                                {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                                    <div class="price">{lang key="from"} {$products.incomingarchiving->pricing()->best()->toFullString()}/{lang key="store.emailServices.domain"}</div>
                                {elseif $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()}
                                    <div class="price">{lang key="from"} {$products.outgoingarchiving->pricing()->best()->toFullString()}/{lang key="store.emailServices.domain"}</div>
                                {elseif $products.incomingoutgoingarchiving->pricing()->best()}
                                    <div class="price">{lang key="from"} {$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}/{lang key="store.emailServices.domain"}</div>
                                {elseif $inPreview}
                                    <div class="price">-</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="archiving">
                                    {lang key="store.emailServices.overview.learn"}
                                </a>
                                <a href="#" class="btn btn-buy" data-target="incomingoutgoingarchiving">
                                    {lang key="store.emailServices.overview.buy"}
                                </a>
                            </div>
                        </div>
                    {/if}
                </div>
            {elseif $inPreview}
                <div class="text-center lead preview-text">Email service products you activate will be displayed here</div>
            {/if}
            <div class="powered-by">
                {lang key='store.poweredBy' service=''}<img src="{$WEB_ROOT}/assets/img/marketconnect/spamexperts/logo_white.png">
            </div>
        </div>
    </div>

    <div class="content-block text20 text-center">
        <div class="container">
            <h2>{lang key="store.emailServices.blockSpamHeadline"}</h2>
        </div>
    </div>

    <div class="content-block tabs light-grey-bg" id="howitworks">
        <div class="container">
            <ul class="nav nav-tabs responsive-tabs-sm" role="tablist">
                {if $products.incoming || $inPreview}
                    <li class="nav-item">
                        <a class="nav-link active" id="incoming-tab" href="#incoming" role="tab" data-toggle="tab" aria-controls="incoming" aria-selected="true">
                            {lang key="store.emailServices.incoming.title"}
                        </a>
                    </li>
                {/if}
                {if $products.outgoing || $inPreview}
                    <li class="nav-item">
                        <a class="nav-link" id="outgoing-tab" href="#outgoing" role="tab" data-toggle="tab" aria-controls="outgoing" aria-selected="false">
                            {lang key="store.emailServices.outgoing.title"}
                        </a>
                    </li>
                {/if}
                {if $products.incomingarchiving || $products.outgoingarchiving || $products.incomingoutgoingarchiving || $inPreview}
                    <li class="nav-item">
                        <a class="nav-link" id="archiving-tab" href="#archiving" role="tab" data-toggle="tab" aria-controls="archiving" aria-selected="false">
                            {lang key="store.emailServices.archiving.title"}
                        </a>
                    </li>
                {/if}
            </ul>
            <div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
            <div class="tab-content">
                <div class="tab-pane active" id="incoming" role="tabpanel" aria-labelledby="incoming-tab">
                    <div class="benefits">
                        <h3>{lang key="store.emailServices.benefits.incoming.title"}</h3>
                        <div class="row">
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.1"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.2"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.3"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.4"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.5"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.6"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.7"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.incoming.8"}
                            </div>
                        </div>
                    </div>

                    <h3{lang key="store.emailServices.benefits.incoming.q1"}</h3>
                    <p>{lang key="store.emailServices.benefits.incoming.a1"}</p>

                    <h3>{lang key="store.emailServices.benefits.incoming.q2"}</h3>
                    <p>{lang key="store.emailServices.benefits.incoming.a2"}</p>

                    <h3>{lang key="store.emailServices.benefits.incoming.q3"}</h3>
                    <p>{lang key="store.emailServices.benefits.incoming.a3"}</p>

                </div>
                <div class="tab-pane" id="outgoing" role="tabpanel" aria-labelledby="outgoing-tab">
                    <div class="benefits">
                        <h3>{lang key="store.emailServices.benefits.outgoing.title"}</h3>
                        <div class="row">
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.1"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.2"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.3"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.4"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.5"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.outgoing.6"}
                            </div>
                        </div>
                    </div>

                    <h3>{lang key="store.emailServices.benefits.outgoing.q1"}</h3>
                    <p>{lang key="store.emailServices.benefits.outgoing.a1"}</p>

                    <h3>{lang key="store.emailServices.benefits.outgoing.q2"}</h3>
                    <p>{lang key="store.emailServices.benefits.outgoing.a2"}</p>

                </div>
                <div class="tab-pane" id="archiving" role="tabpanel" aria-labelledby="archiving-tab">
                    <div class="benefits">
                        <h3>{lang key="store.emailServices.benefits.archiving.title"}</h3>
                        <div class="row">
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.1"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.2"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.3"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.4"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.5"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.6"}
                            </div>
                            <div class="col-lg-6">
                                <i class="fas fa-check"></i>
                                {lang key="store.emailServices.benefits.archiving.7"}
                            </div>
                        </div>
                    </div>

                    <h3>{lang key="store.emailServices.benefits.archiving.q1"}</h3>
                    <p>{lang key="store.emailServices.benefits.archiving.a1"}</p>

                    <h3>{lang key="store.emailServices.benefits.archiving.q2"}</h3>
                    <p>{lang key="store.emailServices.benefits.archiving.a2a"}</p>
                    <p>{lang key="store.emailServices.benefits.archiving.a2b"}</p>

                </div>
            </div>
        </div>
    </div>

    <div class="content-block get-started" id="pricing">
        <div class="container">
            <form method="post" action="{routePath('cart-order')}">
                <input type="hidden" name="productkey" value="{$products.incoming->productKey}" id="productKey">
                <div class="row">
                    <div class="col-md-8">
                        <h2>{lang key="store.emailServices.signup.title"}</h2>
                        <h4>{lang key="store.emailServices.signup.choose"}</h4>
                        {if $numberOfFeaturedProducts > 0}
                            <div class="btn-group choose-product" role="group">
                                {if $products.incoming}
                                    <button type="button" class="btn btn-default active" data-product="incoming">{lang key="store.emailServices.options.incomingFilter"}</button>
                                {/if}
                                {if $products.outgoing}
                                    <button type="button" class="btn btn-default" data-product="outgoing">{lang key="store.emailServices.options.outgoingFilter"}</button>
                                {/if}
                            </div>
                        {elseif $inPreview}
                            {lang key="store.emailServices.preview"}
                        {/if}
                        <br><br>
                        <h4>{lang key="store.emailServices.signup.additional"}</h4>
                        <div class="additional-options">
                            {foreach $productOptions as $productKey => $options}
                                <div class="option options-{$productKey}">
                                    {foreach $options as $option}
                                        <label class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" name="options" value="{$option.product}">
                                            {lang key="store.emailServices.options.addFor" description=$option.description pricing=$option.pricing->toFullString()}
                                        </label><br>
                                    {foreachelse}
                                        {lang key="store.emailServices.signup.none"}
                                    {/foreach}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="col-md-4 text-right">
                        {if $products.incoming && $products.incoming->pricing()->best()}
                            <span class="price price-incoming">{$products.incoming->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                            <span class="price price-incomingarchiving">{$products.incomingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.outgoing && $products.outgoing->pricing()->best()}
                            <span class="price price-outgoing">{$products.outgoing->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()}
                            <span class="price price-outgoingarchiving">{$products.outgoingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingoutgoing && $products.incomingoutgoing->pricing()->best()}
                            <span class="price price-incomingoutgoing">{$products.incomingoutgoing->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingoutgoingarchiving && $products.incomingoutgoingarchiving->pricing()->best()}
                            <span class="price price-incomingoutgoingarchiving">{$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        <br>
                        <button type="submit" class="btn btn-order-now btn-lg mt-md-5">
                            {lang key="store.emailServices.signup.order"}
                        </button>
                    </div>
                </div>
            </form>

            {if !$loggedin && $currencies}
                <br>
                <form method="post" action="">
                    <select name="currency" class="form-control ssl-currency-selector w-25" onchange="submit()">
                        <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                        {foreach $currencies as $currency}
                            <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                        {/foreach}
                    </select>
                </form>
            {/if}

        </div>
    </div>

    <div class="content-block faq" id="faq">
        <div class="container">
            <h3 class="text-center">{lang key="store.emailServices.faqs.title"}</h3>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <h4>{lang key="store.emailServices.faqs.q1"}</h4>
                    <p>{lang key="store.emailServices.faqs.a1"}</p>
                    <hr>
                    <h4>{lang key="store.emailServices.faqs.q2"}</h4>
                    <p>{lang key="store.emailServices.faqs.a2"}</p>
                    <hr class="d-lg-none">
                </div>
                <div class="col-lg-4 col-md-6">
                    <h4>{lang key="store.emailServices.faqs.q3"}</h4>
                    <p>{lang key="store.emailServices.faqs.a3"}</p>
                    <hr>
                    <h4>{lang key="store.emailServices.faqs.q4"}</h4>
                    <p>{lang key="store.emailServices.faqs.a4"}</p>
                    <hr class="d-md-none">
                </div>
                <div class="col-lg-4 col-md-6">
                    <h4>{lang key="store.emailServices.faqs.q5"}</h4>
                    <p>{lang key="store.emailServices.faqs.a5"}</p>
                    <hr>
                    <h4>{lang key="store.emailServices.faqs.q6"}</h4>
                    <p>{lang key="store.emailServices.faqs.a6"}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block">
        <div class="container text-center">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/spamexperts/logo.png">
        </div>
    </div>

</div>

<script>
    $(document).ready(function() {
        $('#inputDomainChooser').multiselect({
            buttonWidth: '250px',
            dropRight: true,
            nonSelectedText: 'Choose domain(s)'
        });

        $('.landing-page.mail-services .get-started .choose-product button').click(function(e) {
            var product = $(this).data('product');
            $('.landing-page.mail-services .get-started .choose-product button').removeClass('active');
            $(this).addClass('active');
            $('.landing-page.mail-services .get-started .additional-options .option').hide();
            $('.landing-page.mail-services .get-started .additional-options .options-' + product).show();
            $('.landing-page.mail-services .get-started .price').hide();
            $('.landing-page.mail-services .get-started .price-' + product).show();
            $('#productKey').val('spamexperts_' + product);
        });

        $('.landing-page.mail-services .get-started .additional-options input[type="checkbox"]').click(function(e) {
            if ($(this).is(":checked")) {
                $('.landing-page.mail-services .get-started .additional-options input[type="checkbox"]').not($(this)).prop('checked', false);
                $('.landing-page.mail-services .get-started .price').hide();
                $('.landing-page.mail-services .get-started .price-' + $(this).val()).show();
                $('#productKey').val('spamexperts_' + $(this).val());
            } else {
                var product = $('.landing-page.mail-services .get-started .choose-product button.active').data('product');
                $('.landing-page.mail-services .get-started .price').hide();
                $('.landing-page.mail-services .get-started .price-' + product).show();
                $('#productKey').val('spamexperts_' + product);
            }
        });

        $('.btn-learn-more').click(function(e) {
            e.preventDefault();
            $('#howitworks a[href="#' + $(this).data('target') + '"]').tab('show');
            smoothScroll('#howitworks');
        });

        $('.btn-buy').click(function(e) {
            e.preventDefault();
            var target = $(this).data('target'),
                pricing = $('#pricing');
            if (target === 'incomingoutgoingarchiving') {
                if (pricing.find('button[data-product="incoming"]').length) {
                    pricing.find('button[data-product="incoming"]').click();
                } else {
                    pricing.find('button[data-product="outgoing"]').click();
                }
                var option = $('input[name="options"][value="incomingoutgoingarchiving"]').first();
                if (option.is(':checked')) {
                    option.click();
                }
                option.click();
            } else {
                pricing.find('button[data-product="' + $(this).data('target') + '"]').click();
            }
            smoothScroll('#pricing');
        });
    });
</script>
