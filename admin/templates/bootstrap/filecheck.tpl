{include file='tpl_inc/header.tpl'}
{include file='tpl_inc/seite_header.tpl' cTitel=__('filecheck') cBeschreibung=__('filecheckDesc') cDokuURL=__('filecheckURL')}

{$alertList->displayAlertByKey('orphanedFilesError')}
{$alertList->displayAlertByKey('modifiedFilesError')}
{$alertList->displayAlertByKey('backupMessage')}
{$alertList->displayAlertByKey('zipArchiveError')}

<div class="card collapsed">
    <div {if count($modifiedFiles) > 0}class="card-header accordion-toggle" data-toggle="collapse" data-target="#pageCheckModifiedFiles" style="cursor:pointer"{else}class="card-header"{/if}>
        <div class="card-title">
            {if count($modifiedFiles) > 0}<i class="fa fas fa-plus"></i> {/if}
            {__('fileCheckNumberModifiedFiles')}: {count($modifiedFiles)}
        </div>
    </div>
    {if count($modifiedFiles) > 0}
        <div class="card-body collapse" id="pageCheckModifiedFiles">
            <p class="alert alert-warning">{__('fileCheckModifiedFilesNote')}</p>
            <div id="contentModifiedFilesCheck">
                <table class="table table-sm table-borderless req table-striped">
                    <thead>
                    <tr>
                        <th class="text-left">{__('file')}</th>
                        <th class="text-right">{__('lastModified')}</th>
                    </tr>
                    </thead>
                    {foreach $modifiedFiles as $file}
                        <tr class="filestate mod{$file@iteration % 2} modified">
                            <td class="text-left">{$file->name}</td>
                            <td class="text-right">{$file->lastModified}</td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    {/if}
</div>
<div class="card collapsed">
    <div class="card-header{if count($orphanedFiles) > 0} accordion-toggle" data-toggle="collapse" data-target="#pageCheckOrphanedFiles" style="cursor:pointer"{else}"{/if}>
        <div class="card-title">
            {if count($orphanedFiles) > 0}<i class="fa fas fa-plus"></i> {/if}
            {__('fileCheckNumberOrphanedFiles')}: {count($orphanedFiles)}
        </div>
    </div>
    {if count($orphanedFiles) > 0}
        <div class="card-body collapse" id="pageCheckOrphanedFiles">
            <p class="alert alert-info">{__('fileCheckOrphanedFilesNote')}</p>
            <div id="contentOrphanedFilesCheck">
                <table class="table table-sm table-borderless req table-striped">
                    <thead>
                        <tr>
                            <th class="text-left">{__('file')}</th>
                            <th class="text-right">{__('lastModified')}</th>
                        </tr>
                    </thead>
                    {$cnt = 0}
                    {$ofc = count($orphanedFiles)}
                    {foreach $orphanedFiles as $file}
                        <tr class="filestate mod{$file@iteration % 2} orphaned">
                            <td class="text-left">{$file->name}</td>
                            <td class="text-right">{$file->lastModified}</td>
                        </tr>
                        {if $cnt++ > 98}
                            <tr>
                                <td colspan="2"><strong>{sprintf(__('And %d more'), $ofc - $cnt)}</strong></td>
                            </tr>
                            {break}
                        {/if}
                    {/foreach}
                </table>
                <div class="save-wrapper">
                    <form method="post">
                        {$jtl_token}
                        <div class="row">
                            <div class="ml-auto col-sm-6 col-xl-auto">
                                <button type="submit" class="btn btn-danger btn-block delete-confirm" name="delete-orphans" value="1" data-modal-body="{__('confirmDeleteText')}">
                                    <i class="fa fas fa-trash"></i> {__('delete')}
                                </button>
                            </div>
                            <div class="col-sm-6 col-xl-auto">
                                <button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target="#show-script" aria-expanded="false" aria-controls="show-script">
                                    <i class="fa fas fa-terminal"></i> {__('showDeleteScript')}
                                </button>
                            </div>
                        </div>
                        <div class="collapse" id="show-script">
                            <div class="card card-body text-left">
                                <pre style="margin-top:1em;">{$deleteScript}</pre>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    {/if}
</div>
{include file='tpl_inc/footer.tpl'}
