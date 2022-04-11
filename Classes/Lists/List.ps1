class List
{
    [System.Collections.ArrayList]$items = @()

    [int]GetSize()
    {
        return $this.items.Count()
    }
    [void]AddToList($c)
    {
           $this.items += $c
    }
    [void]PrintList()
    {
        foreach ($element in $this.items) {
            $msg = "Card: " + $element.GetValue() + " Name: " + $element.GetName() + " Suit: " + $element.GetSymbol()
            Write-Host $msg
          }
    }
}