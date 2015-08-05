
//
//  ScorerTableViewController.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2015-02-13.
//  Copyright (c) 2015 Benjamin Wishart. All rights reserved.
//

import UIKit

struct LimitRow {
    var limit: Int
    var title: String
}

struct ChoiceRow {
    var choices: [String]
    var title: String
}

class ScorerTableViewController: UITableViewController{

    var player: String
    var dynamicSection: Int //section you tapped in
    var dynamicRow: Int //row for limit picker (row you tapped +1)
    var rows: [[ASRow]]
    var toggle: Bool
    
    required init(coder aDecoder: NSCoder) {
        self.player = "None"
        dynamicSection = -1
        dynamicRow = -1
        toggle = false
        
        rows = Array<Array<ASRow>>()
        
        rows.append(Array<ASRow>())
        rows[0].append(ASFinalScoreRow())
        
        rows.append(Array<ASRow>())
        rows[1].append(ASLimitResultRow(title: "Vegetables", withLimit: 4, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,1),(2,2),(3,3),(4,-1)])))
        rows[1].append(ASLimitResultRow(title: "Grain", withLimit: 8, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,3),(4,5),(6,7),(8,-1)])))
        
        rows.append(Array<ASRow>())
        rows[2].append(ASLimitResultRow(title: "Sheep", withLimit: 8, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,3),(4,5),(6,7),(8,-1)])))
        rows[2].append(ASLimitResultRow(title: "Wild Boar", withLimit: 7, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,2),(3,4),(5,6),(7,-1)])))
        rows[2].append(ASLimitResultRow(title: "Cattle", withLimit: 6, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,1),(2,3),(4,5),(6,-1)])))
        
        rows.append(Array<ASRow>())
        var choicesRow: ASChoicesRow = ASChoicesRow(title: "House Type", withChoices: ["Wood", "Clay", "Stone"], modifierRule: ASModifierRule())
        rows[3].append(choicesRow)
        rows[3].append(ASLimitResultRow(title: "Number of Rooms", withLimit: 8, pointsRule: ASInputRule(per: 0)))
        
        rows.append(Array<ASRow>())
        rows[4].append(ASLimitResultRow(title: "Number of Family Members", withLimit: 5, pointsRule: ASInputRule(per: 3)))
 
        rows.append(Array<ASRow>())
        rows[5].append(ASLimitResultRow(title: "Plowed Fields", withLimit: 13, pointsRule: ASRangesRule(pointRanges: [(0,1),(2,2),(3,3),(4,4),(5,-1)])))
        rows[5].append(ASLimitResultRow(title: "Fenced Pastures", withLimit: 8, pointsRule: ASRangesRule(pointRanges: [(0,0),(1,1),(2,2),(3,3),(4,-1)])))
        
        rows.append(Array<ASRow>())
        rows[6].append(ASLimitResultRow(title: "Unused Spaces", withLimit: 8, pointsRule: ASInputRule(per: -1)))
        rows[6].append(ASLimitResultRow(title: "Fenced Stables", withLimit: 7, pointsRule: ASInputRule(per: 1)))
        
        rows.append(Array<ASRow>())
        rows[7].append(ASInputResultRow(displayTitle: "Card Points"))
        rows[7].append(ASInputResultRow(displayTitle: "Bonus Points"))
        rows[7].append(ASInputResultRow(displayTitle: "Begging Cards"))
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = player + " Player"
        toggle = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseCellIdentifier")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row: ASRow = rows[indexPath.section][indexPath.row];
        
        if row is ASLimitResultRow {
            if indexPath.row + 1 < rows[indexPath.section].count && rows[indexPath.section][indexPath.row + 1] is ASLimitRow {
                //hide limit row
                rows[indexPath.section].removeAtIndex(indexPath.row + 1)
                var newIndexPath: NSIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                var indexPaths = [newIndexPath]
                tableView.beginUpdates()
                tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Top)
                tableView.endUpdates()
            } else {
                //show limit row
                rows[indexPath.section].insert(ASLimitRow(limit: (row as! ASLimitResultRow).upperLimit), atIndex: indexPath.row + 1)
                var newIndexPath: NSIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                var indexPaths = [newIndexPath]
                
                tableView.beginUpdates()
                tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Top)
                tableView.endUpdates()
            }
        } else if row is ASInputResultRow {
            if indexPath.row + 1 < rows[indexPath.section].count && rows[indexPath.section][indexPath.row + 1] is ASInputRow {
                rows[indexPath.section].removeAtIndex(indexPath.row + 1)
                var newIndexPath: NSIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                var indexPaths = [newIndexPath]
                tableView.beginUpdates()
                tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Top)
                tableView.endUpdates()
            } else {
                rows[indexPath.section].insert(ASInputRow(), atIndex: indexPath.row + 1)
                var newIndexPath: NSIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
                var indexPaths = [newIndexPath]
                
                tableView.beginUpdates()
                tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Top)
                tableView.endUpdates()
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row: ASRow = rows[indexPath.section][indexPath.row];
        let valueLabelWidth: CGFloat = 40.0
        
        if row is ASLimitResultRow {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultTableViewCellIdentifier", forIndexPath: indexPath) as! ResultTableViewCell
            
            //
            cell.resultValue.text = String(row.value)
            cell.displayTitleLabel.text = row.displayTitle
            
            return cell
        } else if row is ASChoicesRow {
            let cell: MultiChoiceTableViewCell = tableView.dequeueReusableCellWithIdentifier("MultiChoiceTableViewCellIdentifier", forIndexPath: indexPath) as! MultiChoiceTableViewCell
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.textLabel?.text = row.displayTitle
            let rowMultiChoices: [String] = (row as! ASChoicesRow).multiChoices
            
            
            for i in 0...(cell.multiSelect.numberOfSegments - 1) {
                cell.multiSelect.setTitle(rowMultiChoices[i], forSegmentAtIndex: i)
            }
            
            var i = cell.multiSelect.numberOfSegments
            while cell.multiSelect.numberOfSegments < rowMultiChoices.count {
                cell.multiSelect.insertSegmentWithTitle(rowMultiChoices[i], atIndex: i, animated: false)
                i++
            }

            cell.row = row as? ASChoicesRow
            
            cell.contentView.bringSubviewToFront(cell.multiSelect)
            return cell
        } else if row is ASInputResultRow {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultTableViewCellIdentifier", forIndexPath: indexPath) as! ResultTableViewCell
            
            cell.displayTitleLabel.text = row.displayTitle
            cell.resultValue.text = String(row.value)
            
            return cell
        } else if row is ASLimitRow {
            let cell: LimitPickerTableViewCell = tableView.dequeueReusableCellWithIdentifier("LimitPickerTableViewCellIdentifier", forIndexPath: indexPath) as! LimitPickerTableViewCell
            let prevRow: ASLimitResultRow = rows[indexPath.section][indexPath.row - 1] as! ASLimitResultRow
            
            cell.delegate = prevRow
            
            NSNotificationCenter.defaultCenter().addObserverForName("limitPickerDidChange", object: nil, queue: nil) {(notification: NSNotification!) -> Void in
                tableView.reloadData()
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.upperLimit = (row as! ASLimitRow).upperLimit
            cell.LimitPicker.reloadAllComponents()
            return cell
            
        } else if row is ASInputRow {
            let cell: NumberInputTableViewCell = tableView.dequeueReusableCellWithIdentifier("NumberInputTableViewCellIdentifier", forIndexPath: indexPath) as! NumberInputTableViewCell
            let prevRow: ASInputResultRow = rows[indexPath.section][indexPath.row - 1] as! ASInputResultRow
            
            cell.delegate = prevRow
            
            NSNotificationCenter.defaultCenter().addObserverForName(" ", object: nil, queue: nil) {(notification: NSNotification!) -> Void in
                tableView.reloadData()
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        } else if row is ASFinalScoreRow {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultTableViewCellIdentifier", forIndexPath: indexPath) as! ResultTableViewCell
            
            cell.displayTitleLabel.text = row.displayTitle
            cell.userInteractionEnabled = false
            
            NSNotificationCenter.defaultCenter().addObserverForName("finalScoreNotification", object: nil, queue: nil) {(notification: NSNotification!) -> Void in
                //set final score here
                (cell as ResultTableViewCell).resultValue.text = String(ASRule.mainPoints)
                return
            }
            
            return cell
        } else {
            return tableView.dequeueReusableCellWithIdentifier("reuseCellIdentifier", forIndexPath: indexPath) as! UITableViewCell
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == rows.count - 1 {
            return 20.0
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if rows[indexPath.section][indexPath.row] is ASLimitRow {
            return 162.0
        } else {
            return 43.0
            //return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return rows.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
}
