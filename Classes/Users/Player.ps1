class Player:User
{
    Player()
    {

    }
    [string]$userInput = ""

    #Logic for 
    [void]PlayerChoice()
    {
        if($this.GetStatus() -eq "Active")
        {
            $choiceflag = $false
            while(!$choiceflag)
            {
                $message = "Hit or Stay?"
                try {
                    $this.userInput = Read-Host -Prompt $message
                    $choiceflag = $true
                }
                catch {
                    Write-Host "Error: Invalid entry! Try again"
                }
            }
        }
    }
}