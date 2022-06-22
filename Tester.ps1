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

if($gm.$m_Dealer.GetStatus -ne "Busted")
{
    #Player turn
    $gm.PrintBoard()
    while($gm.m_Player.GetStatus() -eq "Active")
    {
        $gm.m_Player.PlayerChoice()
        $gm.ManagerResponseToPlayer()
        $gm.PrintBoard()
        $gm.UpdateAllStatus()
    }

    $gm.m_Player.PrintStatus()

    #Dealer turn
    while($gm.m_Dealer.GetStatus() -eq "Active")
    {
        $gm.DealerTurn()
        $gm.PrintBoard()
        $gm.UpdateAllStatus()
    }
    $gm.m_Dealer.PrintStatus()
}
else {
    Write-Host "Dealer Busted! You Win!"
}
