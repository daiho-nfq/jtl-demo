<?php declare(strict_types=1);

namespace JTL\Widgets;

/**
 * Class Help
 * @package JTL\Widgets
 */
class Help extends AbstractWidget
{
    /**
     *
     */
    public function init()
    {
        $this->setPermission('DASHBOARD_ALL');
    }

    /**
     * @return string
     */
    public function getContent()
    {
        return $this->oSmarty->fetch('tpl_inc/widgets/help.tpl');
    }
}
