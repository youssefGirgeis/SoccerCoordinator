// ---------- SoccerCoordinator - Project# 1 ------------


let players: [[String:String]] = [
    ["name": "Joe Smith", "height": "42", "experience": "yes", "guardian": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "36", "experience": "yes", "guardian": "Clara Tanner"],
    ["name": "Bill Bon", "height": "43", "experience": "yes", "guardian": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "experience": "no", "guardian": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": "40", "experience": "no", "guardian": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "experience": "no", "guardian": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": "45", "experience": "no", "guardian": "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "experience": "yes", "guardian": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "experience": "yes", "guardian": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41", "experience": "no", "guardian": "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "experience": "no", "guardian": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "experience": "no", "guardian": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "experience": "yes", "guardian": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "experience": "no", "guardian": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "experience": "no", "guardian": "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "experience": "yes", "guardian": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "experience": "yes", "guardian": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "experience": "yes", "guardian": "Hyman and Rachel Krustofski"]
]


var teamDragons: [[String:String]] = []
var teamSharks: [[String:String]] = []
var teamRaptors: [[String:String]] = []
let numberOfTeams = 3
var allTeamsWithNames: [[String: String]] = [] // this variable will hold all teams after assigning a team to each player

//////////////////////////////////////////////////////////////////


// this function select players that have experience and adds them to an array [playersWithExperience], and this array is array of dictionaries. it also returns array of dictionaries of all experienced players

func experiencedPlayers() -> [[String:String]]{
    var playersWithExperience: [[String:String]] = []
    for player in players{
        if player["experience"] == "yes"{
            playersWithExperience.append(player)
        }
    }
    return playersWithExperience
}

/////////////////////////////////////////////////////////////////

// this function select players that have no experience and adds them to an array [playersWithNoExperience], and this array is array of dictionaries. it also returns array of dictionaries of all non experienced players

func nonExperiencedPlayers() -> [[String: String]]{
    var playersWithNoExperience: [[String:String]] = []
    for player in players{
        if player["experience"] == "no" {
            playersWithNoExperience.append(player)
        }
    }
    return playersWithNoExperience
}

///////////////////////////////////////////////////////////////

// function is used to assign each player to team, where experienced players are equally distributed in all teams.
func addPlayersToTeams(){
    let playersWithExperience = experiencedPlayers()
    let number = playersWithExperience.count/numberOfTeams // number of experienced players per team

    var counter = 0; // to iterate through all experiened players
    var counter2 = 0 // to iterate through all non experiended players
    
    for playerWithExperience in playersWithExperience{
        switch counter{
            case 0..<number: teamDragons.append(playerWithExperience)
            case number..<number*2: teamSharks.append(playerWithExperience)
            case number*2..<number*3: teamRaptors.append(playerWithExperience)
            default: print("")
        }
        counter += 1
    }
    
    let playersWithNoExperience = nonExperiencedPlayers()
    let number2 = playersWithNoExperience.count/numberOfTeams // number of non-experienced players per team
    
    for playerWithNoExperience in playersWithNoExperience{
        switch counter2{
            case 0..<number2: teamDragons.append(playerWithNoExperience)
            case number2..<number2*2: teamSharks.append(playerWithNoExperience)
            case number2*2..<number2*3: teamRaptors.append(playerWithNoExperience)
            default: print("")
        }
        counter2 += 1
    }
}

////////////////////////////////////////////////////////////////////////////

//function below is used to add team to each player dictionary, the team where player was assigned to.

func addTeamName(team: [[String: String]], name: String){
    var allTeams = team
    for index in 0..<team.count{
        allTeams[index]["teamName"] = name
    }
    allTeamsWithNames += allTeams //this variable will hold all teams after assigning a team to each player

}

///////////////////////////////////////////////////////////////////////////

//fucntion below is used to create a letter for each player in all teams

func createLetters(){
    
    var letters: [String] = []
    for player in allTeamsWithNames{
        
        let guardian: String! = player["guardian"]
        let playerName: String! = player["name"]
        let teamName: String! = player["teamName"]
        let date: String
        if teamName == "Dragons" {
            date = "March 17, 1pm"
        } else if teamName == "Sharks" {
            date = "March 17, 3pm"
        } else {
            date = "March 18, 1pm"
        }
        let letter = "Hello \(guardian!), \n\n\(playerName!) is on team \(teamName!) and the start date and time is \(date). Please be on time.\n\nThank you \nYoussef\n\n"
        letters.append(letter)
    }
    printLetters(letters: letters)
}

//////////////////////////////////////////////////////////////////////////

// this function is used to print all letters to the concole

func printLetters(letters: [String]){
    
    for letter in letters{
        print(letter)
    }
}

///////////////////////////////////////////////////////////////////////

// here i am just calling the function i have created.
addPlayersToTeams()
addTeamName(team: teamDragons, name: "Dragons")
addTeamName(team: teamSharks, name: "Sharks")
addTeamName(team: teamRaptors, name: "Raptors")
createLetters()




