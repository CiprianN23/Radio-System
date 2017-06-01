#define FILTERSCRIPT
#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS 50
#include <izcmd>
#include <sscanf2>
 
#define Radio 7500
#define youtube 7501
 
new radiolis[MAX_PLAYERS];
public OnPlayerDisconnect(playerid, reason)
{
    radiolis[playerid] = 0;
}
public OnPlayerConnect(playerid)
{
    radiolis[playerid] = 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case Radio:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: return  ProFM(playerid);
                    case 1: return RadioHIT(playerid);
                    case 2: return Wish(playerid);
                    case 3: return Party(playerid);
                    case 4: return Manele(playerid);
                    case 5: return Trap(playerid);
                    case 6: return Rock(playerid);
                    case 7: return Hip(playerid);
                    case 8: return Paradise(playerid);
                    case 9: return Radio21(playerid);
                    case 10: return SuperFM(playerid);
                    case 11: return EuropaFM(playerid);
                    case 12: return Bandit(playerid);
                    case 13: return Mafia(playerid);
                    case 14: return Intens(playerid);
                    case 15: return Gamelive(playerid);
                    case 16: ShowPlayerDialog(playerid,youtube, DIALOG_STYLE_INPUT, "Youtube", "Enter a youtube link below:", "Start", "Cancel");
                    case 17: return Stop(playerid);
                }
            }
       
        }
        case youtube:
        {
            if(!response)
                return 1;
            if(response)
            {
                new string[180];
                format(string, 160, "https://www.youtubeinmp3.com/fetch/?video=%s", inputtext);
                PlayAudioStreamForPlayer(playerid, string);
            }
 
        }
    }
    return 0;
}
CMD:radio(playerid, params[])
{
    new string[540], hit, fm, wish, party, trap, rock, hip, para, manele, radio21, superFM, europaFM, bandit,mafia,intens,gl;
    for(new i=0,j=GetPlayerPoolSize(); i<=j;i++)
    {
        if(!IsPlayerConnected(i)) continue;
        switch(radiolis[i])
        {
            case 1: fm++;
            case 2: hit++;
            case 3: wish++;
            case 4: party++;
            case 5: manele++;
            case 6: trap++;
            case 7: rock++;
            case 8: hip++;
            case 9: para++;
            case 10: radio21++;
            case 11: superFM++;
            case 12: europaFM++;
            case 13: bandit++;
            case 14: mafia++;
            case 15: intens++;
            case 16: gl++;
        }
       
    }
    format(string, sizeof(string), "%s#\tRadio Name\tListeners\n", string);
    format(string, sizeof(string), "%s1.\tPro FM\t%d Listeners\n", string, fm);
    format(string, sizeof(string), "%s2.\tRadio HiT FM \t%d Listeners\n", string, hit);
    format(string, sizeof(string), "%s3.\tRadio Wish\t%d Listeners\n", string, wish);  
    format(string, sizeof(string), "%s4.\tRadio Party Romania\t%d Listeners\n", string, party);
    format(string, sizeof(string), "%s5.\tRadio Taraf\t%d Listeners\n", string, manele);
    format(string, sizeof(string), "%s6.\tTrap Radio\t%d Listeners\n", string, trap);
    format(string, sizeof(string), "%s7.\tRadio Music Rock\t%d Listeners\n", string, rock);
    format(string, sizeof(string), "%s8.\tRadio Romanian Hip-Hop\t%d Listeners\n", string, hip);
    format(string, sizeof(string), "%s9.\tRadio Paradise\t%d Listeners\n", string, para);
    format(string, sizeof(string), "%s10.\tRadio 21\t%d Listeners\n", string, radio21);
    format(string, sizeof(string), "%s11.\tRadio SuperFM\t%d Listeners\n", string, superFM);
    format(string, sizeof(string), "%s12.\tRadio EuropaFM\t%d Listeners\n", string, europaFM);
    format(string, sizeof(string), "%s13.\tRadio Bandit\t%d Listeners\n", string, bandit);
    format(string, sizeof(string), "%s14.\tRadio Mafia\t%d Listeners\n", string, mafia);
    format(string, sizeof(string), "%s15.\tRadio Intens\t%d Listeners\n", string, intens);
    format(string, sizeof(string), "%s16.\tRadio GameLive\t%d Listeners\n", string, intens);
    format(string, sizeof(string), "%s17.\tYoutube Player\n", string);
    format(string, sizeof(string), "%s\tStop Radio\t", string);
   
 
    ShowPlayerDialog(playerid, Radio, DIALOG_STYLE_TABLIST_HEADERS, "Radio Stations",string,"Select", "Cancel");
    return 1;
}
ProFM(playerid)
{
    radiolis[playerid] = 1;
    PlayAudioStreamForPlayer(playerid, "http://stream.profm.ro:8012/profm.mp3");
    return 1;
}
RadioHIT(playerid)
{
    radiolis[playerid] = 2;
    PlayAudioStreamForPlayer(playerid, "http://www.radio-hit.ro/asculta.m3u");
    return 1;
}
Wish(playerid)
{
    radiolis[playerid] = 3;
    PlayAudioStreamForPlayer(playerid, "http://www.radiowish.ro/live.m3u");
    return 1;
}
Party(playerid)
{
    radiolis[playerid] = 4;
    PlayAudioStreamForPlayer(playerid, "http://www.partyradio.ro/live.m3u");
    return 1;
}
Manele(playerid)
{
    radiolis[playerid] = 5;
    PlayAudioStreamForPlayer(playerid, "http://live.radiotaraf.ro:8181");
    return 1;
}
Trap(playerid)
{
    radiolis[playerid] = 6;
    PlayAudioStreamForPlayer(playerid, "http://listen.radionomy.com/It-saTrapRadio");
    return 1;
}
Rock(playerid)
{
    radiolis[playerid] = 7;
    PlayAudioStreamForPlayer(playerid, "http://www.radiogmusic.com/rock.m3u");
    return 1;
}
Hip(playerid)
{
    radiolis[playerid] = 8;
    PlayAudioStreamForPlayer(playerid, "http://radioromanian.net/hiphop.pls");
    return 1;
}
Paradise(playerid)
{
    radiolis[playerid] = 9;
    PlayAudioStreamForPlayer(playerid, "http://www.radioparadise.com/musiclinks/rp_128.m3u");
    return 1;
}
Radio21(playerid)
{
    radiolis[playerid] = 10;
    PlayAudioStreamForPlayer(playerid, "http://astreaming.radio21.ro:8000/radio21_mp3_64k");
    return 1;
}
SuperFM(playerid)
{
    radiolis[playerid] = 11;
    PlayAudioStreamForPlayer(playerid, "http://82.77.45.227:8102");
    return 1;
}
EuropaFM(playerid)
{
    radiolis[playerid] = 12;
    PlayAudioStreamForPlayer(playerid, "http://astreaming.europafm.ro:8000/europafm_mp3_64k");
    return 1;
}
Bandit(playerid)
{
    radiolis[playerid] = 13;
    PlayAudioStreamForPlayer(playerid, "http://radiobandit.mine.nu:8000/");
    return 1;
}
Mafia(playerid)
{
    radiolis[playerid] = 14;
    PlayAudioStreamForPlayer(playerid, "http://37.59.224.227:1717/");
    return 1;
}
Intens(playerid)
{
    radiolis[playerid] = 15;
    PlayAudioStreamForPlayer(playerid, "http://live.radiointens.ro:8070/");
    return 1;
}
Gamelive(playerid)
{
    radiolis[playerid] = 16;
    PlayAudioStreamForPlayer(playerid, "http://radio.paginieuropene.com:8051/stream");
    return 1;
}
Stop(playerid)
{  
    radiolis[playerid] = 0;
    StopAudioStreamForPlayer(playerid);
    return 1;
}