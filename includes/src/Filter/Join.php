<?php declare(strict_types=1);

namespace JTL\Filter;

/**
 * Class Join
 * @package JTL\Filter
 */
class Join implements JoinInterface
{
    /**
     * @var string
     */
    private string $type = 'JOIN';

    /**
     * @var string
     */
    private string $table = '';

    /**
     * @var string
     */
    private string $comment = '';

    /**
     * @var string
     */
    private string $on = '';

    /**
     * @var string
     */
    private string $origin = '';

    /**
     * @inheritdoc
     */
    public function setOrigin(string $origin): JoinInterface
    {
        $this->origin = $origin;

        return $this;
    }

    /**
     * @inheritdoc
     */
    public function getOrigin(): string
    {
        return $this->origin;
    }

    /**
     * @inheritdoc
     */
    public function setType(string $type): JoinInterface
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @inheritdoc
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * @inheritdoc
     */
    public function getTable(): string
    {
        return $this->table;
    }

    /**
     * @inheritdoc
     */
    public function setTable(string $table): JoinInterface
    {
        $this->table = $table;

        return $this;
    }

    /**
     * @inheritdoc
     */
    public function getComment(): string
    {
        return empty($this->comment)
            ? ''
            : "\n#" . $this->comment . "\n";
    }

    /**
     * @inheritdoc
     */
    public function setComment(string $comment): JoinInterface
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * @inheritdoc
     */
    public function getOn(): string
    {
        return $this->on;
    }

    /**
     * @inheritdoc
     */
    public function setOn(string $on): JoinInterface
    {
        $this->on = $on;

        return $this;
    }

    /**
     * @return string
     */
    public function __toString(): string
    {
        return $this->getSQL();
    }

    /**
     * @inheritdoc
     */
    public function getSQL(): string
    {
        $on = $this->getOn();
        if ($on !== '') {
            $on = ' ON ' . $on;
        }
        return $this->getTable() !== ''
            ? $this->getComment() . $this->getType() . ' ' . $this->getTable() . $on
            : '';
    }
}
