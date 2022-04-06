class List
{
    [System.Collections.ArrayList]$items = @()
    [int]$size

    [void]SetSize($temp)
    {
        $this.size = $temp
    }
    [int]GetSize()
    {
        return $this.size
    }
    [void]AddToList($c)
    {
           $this.items += $c
    }
    [void]PrintList()
    {
        foreach ($element in $this.items) {
            $msg = "Card: " + $element.GetValue() + " Name:" + $element.GetName() + " Suit:" + $element.GetSymbol()
            Write-Host $msg
          }
    }
}