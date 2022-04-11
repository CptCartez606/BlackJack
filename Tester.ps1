#load all the scripts
. .\Classes\Card.ps1
. .\Classes\Lists\List.ps1
. .\Classes\Lists\Hand.ps1
. .\Classes\Lists\Deck.ps1
. .\Classes\Users\User.ps1
. .\Classes\Users\Player.ps1
. .\Classes\Users\Dealer.ps1

$dealer = [Dealer]::new()
$dealer.DealCards()
$dealer.PHand.PrintList()