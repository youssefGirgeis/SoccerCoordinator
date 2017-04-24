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
var allTeamsWithNames: [[String: String]] = []

//////////////////////////////////////////////////////////////////

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

func addPlayersToTeams(){
    let playersWithExperience = experiencedPlayers()
    let number = playersWithExperience.count/numberOfTeams // number of experienced players per team

    var counter = 0;
    var counter2 = 0
    
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

func addTeamName(team: [[String: String]], name: String){
    var allTeams = team
    for index in 0..<team.count{
        allTeams[index]["teamName"] = name
    }
    allTeamsWithNames += allTeams
}

///////////////////////////////////////////////////////////////////////////

func createLetters(){
    
    var letters: [String] = []
    for player in allTeamsWithNames{
        //print(allTeamsWithNames[index]["guardian"])
        
        var guardian: String! = player["guardian"]
        var playerName: String! = player["name"]
        var teamName: String! = player["teamName"]
        var date: String
        if teamName == "Dragons" {
            date = "March 17, 1pm"
        } else if teamName == "Sharks" {
            date = "March 17, 3pm"
        } else {
            date = "March 18, 1pm"
        }
        
        var letter = "Hello \(guardian!), \(playerName!) is on team \(teamName!) and the start date and time is \(date)"
        letters.append(letter)
    }
    
    printLetters(letters: letters)
}

func printLetters(letters: [String]){
    
    for letter in letters{
        print(letter)
    }
}



addPlayersToTeams()
addTeamName(team: teamDragons, name: "Dragons")
addTeamName(team: teamSharks, name: "Sharks")
addTeamName(team: teamRaptors, name: "Raptors")
createLetters()




