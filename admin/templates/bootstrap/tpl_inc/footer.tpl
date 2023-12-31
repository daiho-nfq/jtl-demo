{if $account}
        <button class="navbar-toggler sidebar-toggler collapsed" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="modal" tabindex="-1" role="dialog" id="modal-footer">
            <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title"></h2>
                        <button type="button" class="close" data-dismiss="modal">
                            <i class="fal fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>

        <div class="modal" tabindex="-1" role="dialog" id="modal-footer-delete-confirm">
            <div id="modal-footer-delete-confirm-default-title" class="d-none">{__('defaultDeleteConfirmTitle')}</div>
            <div id="modal-footer-delete-confirm-default-submit" class="d-none">{__('delete')}</div>
            <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title"></h2>
                        <button type="button" class="close" data-dismiss="modal">
                            <i class="fal fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="ml-auto col-sm-6 col-xl-auto mb-2">
                                <button type="button" id="modal-footer-delete-confirm-yes" class="btn btn-danger btn-block">
                                    <i class="fas fa-trash-alt"></i> {__('delete')}
                                </button>
                            </div>
                            <div class="col-sm-6 col-xl-auto">
                                <button type="button" class="btn btn-outline-primary btn-block" data-dismiss="modal">
                                    {__('cancelWithIcon')}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
    </div>
</div>{* /backend-wrapper *}
{$finderURL = $adminURL|cat:'/'|cat:JTL\Router\Route::ELFINDER}
<script>
    if(typeof CKEDITOR !== 'undefined') {
        CKEDITOR.editorConfig = function(config) {
            config.language = '{$language}';
            config.removeDialogTabs = 'link:upload;image:Upload';
            config.defaultLanguage = 'en';
            config.startupMode = '{if ($config.global.admin_ckeditor_mode|default:'') === 'Q'}source{else}wysiwyg{/if}';
            config.htmlEncodeOutput = false;
            config.basicEntities = false;
            config.htmlEncodeOutput = false;
            config.allowedContent = true;
            config.enterMode = CKEDITOR.ENTER_P;
            config.entities = false;
            config.entities_latin = false;
            config.entities_greek = false;
            config.ignoreEmptyParagraph = false;
            config.filebrowserBrowseUrl      = '{$finderURL}?ckeditor=1&mediafilesType=misc&token={$smarty.session.jtl_token}';
            config.filebrowserImageBrowseUrl = '{$finderURL}?ckeditor=1&mediafilesType=image&token={$smarty.session.jtl_token}';
            config.filebrowserFlashBrowseUrl = '{$finderURL}?ckeditor=1&mediafilesType=video&token={$smarty.session.jtl_token}';
            config.filebrowserUploadUrl      = '{$finderURL}?ckeditor=1&mediafilesType=misc&token={$smarty.session.jtl_token}';
            config.filebrowserImageUploadUrl = '{$finderURL}?ckeditor=1&mediafilesType=image&token={$smarty.session.jtl_token}';
            config.filebrowserFlashUploadUrl = '{$finderURL}?ckeditor=1&mediafilesType=video&token={$smarty.session.jtl_token}';
            config.extraPlugins = 'codemirror';
            config.fillEmptyBlocks = false;
            config.autoParagraph = false;
        };
        CKEDITOR.editorConfig(CKEDITOR.config);
        $.each(CKEDITOR.dtd.$removeEmpty, function (i, value) {
            CKEDITOR.dtd.$removeEmpty[i] = false;
        });
        CKEDITOR.on( 'instanceReady', function( evt ) {
            evt.editor.dataProcessor.htmlFilter.addRules( {
                elements: {
                    img: function(el) {
                        el.addClass('img-fluid');
                    }
                }
            });
        });
    }
    $('.select2').select2();
    $(function() {
        ioCall('notificationAction', ['update'], undefined, undefined, undefined, true);
    });

    $( document ).scroll(function () {
        $('[name="scrollPosition"]').val(window.scrollY);
    });

    {if !empty($scrollPosition)}
        var scrollPosition = '{$scrollPosition}';
        $('html, body').animate({
            scrollTop: $("html").offset().top + scrollPosition
        }, 1000);
    {/if}
</script>

{/if}
</body></html>
