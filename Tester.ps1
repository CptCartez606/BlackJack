#load all the scripts - dont fucking move these
. .\Classes\Card.ps1
. .\Classes\Lists\List.ps1
. .\Classes\Lists\Hand.ps1
. .\Classes\Lists\Deck.ps1
. .\Classes\Users\User.ps1
. .\Classes\Users\Player.ps1
. .\Classes\Users\Dealer.ps1
. .\Classes\GameManager.ps1

$gm = [GameManager]::new()
$gm.InitalDealCards()

while($gm.m_Player.GetStatus() -eq "Active")
{
    $gm.PrintBoard()
    $gm.PlayerChoice()
}

switch($gm.m_Player.GetStatus())
{
    "Staying"
    {
        Write-Host "Staying"
    }
    "Black Jack"
    {
        Write-Host "Black Jack!"
    }
    "Busted"
    {
        Write-Host "Busted!"
    }
}