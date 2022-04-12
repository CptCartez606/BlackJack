class List
{
    [System.Collections.ArrayList]$m_items = @()

    [int]GetSize()
    {
        return $this.m_items.Count()
    }
    [void]AddToList($c)
    {
           $this.m_items += $c
    }
    [void]PrintList()
    {
        foreach ($element in $this.m_items) {
            $msg = "Card: " + $element.GetValue() + " Name: " + $element.GetName() + " Suit: " + $element.GetSymbol()
            Write-Host $msg
          }
    }
}