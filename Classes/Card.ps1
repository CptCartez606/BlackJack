class Card
{
    [int]$m_value
    [string]$m_suit
    [string]$m_name

    Card([int]$val, [string]$sym, [string]$n)
    {
        $this.m_value = $val
        $this.m_suit = $sym
        $this.m_name = $n
    }

    [int]GetValue()
    {
        return $this.m_value
    }
    [string]GetSymbol()
    {
        return $this.m_suit
    }
    [string]GetName()
    {
        return $this.m_name
    }
}