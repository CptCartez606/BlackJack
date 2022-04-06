class Card
{
    [int]$value
    [string]$suit
    [string]$name

    Card([int]$val, [string]$sym, [string]$n)
    {
        $this.value = $val
        $this.suit = $sym
        $this.name = $n
    }

    [int]GetValue()
    {
        return $this.value
    }
    [string]GetSymbol()
    {
        return $this.suit
    }
    [string]GetName()
    {
        return $this.name
    }
}