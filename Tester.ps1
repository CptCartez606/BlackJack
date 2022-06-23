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
        $gm.UpdateAllStatus()
        if($gm.m_Player.GetStatus() -ne "Staying"){
            $gm.PrintBoard()
        }
    }

    $gm.m_Player.PrintStatus()
    Pause
    $gm.PrintBoard()

    #Dealer turn
    while($gm.m_Dealer.GetStatus() -eq "Active")
    {
        $gm.DealerTurn()
        $gm.UpdateAllStatus()
        if($gm.m_Dealer.GetStatus() -ne "Staying"){
            $gm.PrintBoard()
        }
    }

    $gm.EndGameLogic()
}
else {
    Write-Host "Dealer Busted! You Win!"
}
