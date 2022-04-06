class User
{
    [Hand]$PHand

    [string]$name

    User()
    {
        $this.PHand = [Hand]::new()
    }

    [void]AddToHand($param)
    {
        $this.PHand.AddToList($param)
    }
}