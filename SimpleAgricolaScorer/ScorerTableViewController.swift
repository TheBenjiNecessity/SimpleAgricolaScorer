
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

struct openedRow {
    var section: Int = -1
    var row: Int  = -1
}

class ScorerTableViewController: UITableViewController{

    var player: ASPlayer? = nil
    var oldRow: Int
    var newRow: Int
    var rows: [ASRow] = [ASRow]()
    var toggle: Bool
    
    required init(coder aDecoder: NSCoder) {
        oldRow = -1
        newRow = -1
        toggle = false
        
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = player?.displayTitle()
        toggle = false
        
        let nib = UINib(nibName: "ASFinalScoreHeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "ASFinalTableHeaderViewIdentifier")
        
        // MARK: Setup row models
        let vegetableRow = ASLimitResultRow(title: "Vegetables",
                                            withUpperLimit: 4,
                                            pointsRule: player!.vegetableRule,
                                            row: ASLimitRow(limit: 4))
        
        let grainRow = ASLimitResultRow(title: "Grain",
                                        withUpperLimit: 8,
                                        pointsRule: player!.grainRule,
                                        row: ASLimitRow(limit: 8))
        
        let sheepRow = ASLimitResultRow(title: "Sheep",
                                        withUpperLimit: 8,
                                        pointsRule: player!.sheepRule,
                                        row: ASLimitRow(limit: 8))
        
        let boarRow = ASLimitResultRow(title: "Wild Boar",
                                       withUpperLimit: 7,
                                       pointsRule: player!.boarRule,
                                       row: ASLimitRow(limit: 7))
        
        let cattleRow = ASLimitResultRow(title: "Cattle",
                                         withUpperLimit: 6,
                                         pointsRule: player!.cattleRule,
                                         row: ASLimitRow(limit: 6))
        
        let roomsRow: ASLimitResultRow = ASLimitResultRow(title: "Number of Rooms",
                                                          withUpperLimit: 8,
                                                          pointsRule: player!.roomsRule,
                                                          row: ASLimitRow(limit: 8))
        
        let houseTypeRow: ASChoicesRow = ASChoicesRow(title: "House Type",
                                                      withChoices: ["Wood", "Clay", "Stone"],
                                                      multiplierChoices: [1, 2, 3],
                                                      modifyingRule: player!.roomsRule)
        
        
        let membersRow = ASLimitResultRow(title: "Number of Family Members",
                                          withUpperLimit: 5,
                                          lowerLimit: 2,
                                          pointsRule: player!.membersRule,
                                          row: ASLimitRow(limit: 5, lowerLimit: 2))
        
//        let membersRow = ASLimitResultRow(title: "Number of Family Members",
//                                          withUpperLimit: 5,
//                                          pointsRule: player!.membersRule,
//                                          row: ASLimitRow(limit: 8))
        
        let plowedFieldsRow = ASLimitResultRow(title: "Plowed Fields",
                                               withUpperLimit: 13,
                                               pointsRule: player!.plowedFieldsRule,
                                               row: ASLimitRow(limit: 13))
        
        let fencedPasturesRow = ASLimitResultRow(title: "Fenced Pastures",
                                                 withUpperLimit: 8,
                                                 pointsRule: player!.fencedPasturesRule,
                                                 row: ASLimitRow(limit: 8))
        
        let unusedSpacesRow = ASLimitResultRow(title: "Unused Spaces",
                                               withUpperLimit: 8,
                                               pointsRule: player!.unusedSpacesRule,
                                               row: ASLimitRow(limit: 8))
        
        let fencedStablesRow = ASLimitResultRow(title: "Fenced Stables",
                                                withUpperLimit: 7,
                                                pointsRule: player!.fencedStablesRule,
                                                row: ASLimitRow(limit: 7))
        
        let cardPointsRow = ASInputResultRow(displayTitle: "Card Points", row: ASInputRow())
        let bonusPointsRow = ASInputResultRow(displayTitle: "Bonus Points", row: ASInputRow())
        let beggingCardsRow = ASInputResultRow(displayTitle: "Begging Cards", row: ASInputRow())
        
        // MARK: Setup row views
        rows = Array<ASRow>()
        
        rows.append(vegetableRow)
        rows.append(grainRow)
        
        rows.append(ASDividerRow())
        
        rows.append(sheepRow)
        rows.append(boarRow)
        rows.append(cattleRow)
        
        rows.append(ASDividerRow())
        
        
        rows.append(houseTypeRow)
        rows.append(roomsRow)
        
        rows.append(ASDividerRow())
        
        rows.append(membersRow)
        
        rows.append(ASDividerRow())
        
        rows.append(plowedFieldsRow)
        rows.append(fencedPasturesRow)
        
        rows.append(ASDividerRow())
        
        rows.append(unusedSpacesRow)
        rows.append(fencedStablesRow)
        
        rows.append(ASDividerRow())
        
        rows.append(cardPointsRow)
        rows.append(bonusPointsRow)
        rows.append(beggingCardsRow)
        
        rows.append(ASDividerRow())
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = rows[indexPath.row]
        if !row.shouldSelect {
            return
        }
        
        newRow = indexPath.row + 1
        
        if noOldRow() {
            insertRowIntoDataSource((row as! ASResultRow).extender)
        } else if oldRowEqualsNewRow() {
            deleteRowInDataSource()
        } else if oldRowIsLower() {
            deleteRowInDataSource()
            insertRowIntoDataSource((row as! ASResultRow).extender)
        } else if oldRowIsHigher() {
            insertRowIntoDataSource((row as! ASResultRow).extender)
            deleteRowInDataSource()
        } else {
            insertRowIntoDataSource((row as! ASResultRow).extender)
            deleteRowInDataSource()
        }
        
        
        tableView.beginUpdates()
        if noOldRow() {
            insertAsRowInTableView()
            oldRow = newRow
        } else if oldRowEqualsNewRow() {
            deleteASRowFromTableView()
            oldRow = -1
        } else if oldRowIsLower() {
            deleteASRowFromTableView()
            insertAsRowInTableView()
            oldRow = newRow
        } else if oldRowIsHigher() {
            insertAsRowInTableView()
            deleteASRowFromTableView()
            oldRow = newRow
        } else {
            insertAsRowInTableView()
            deleteASRowFromTableView()
            oldRow = newRow
        }
        tableView.endUpdates()
        
        let newIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        tableView.scrollToRowAtIndexPath(newIndexPath, atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
    }
    
    func oldRowEqualsNewRow() -> Bool {
        return oldRow == newRow
    }
    
    func noOldRow() -> Bool {
        return oldRow == -1
    }
    
    func oldRowIsHigher() -> Bool {
        return oldRow < newRow
    }
    
    func oldRowIsLower() -> Bool {
        return oldRow > newRow
    }
    
    func insertAsRowInTableView() {
        let newIndexPath: NSIndexPath = NSIndexPath(forRow: newRow, inSection: 0)
        let indexPaths = [newIndexPath]

        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Middle)
    }
    
    func deleteASRowFromTableView() {
        let oldIndexPath: NSIndexPath = NSIndexPath(forRow: oldRow, inSection: 0)
        let indexPaths = [oldIndexPath]
        
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Middle)
    }
    
    func insertRowIntoDataSource(row: ASRow) {
        if (newRow <= rows.count - 1) {
            rows.insert(row, atIndex: newRow)
        } else {
            rows.append(row)
        }
    }
    
    func deleteRowInDataSource() {
        rows.removeAtIndex(oldRow)
        
        if newRow > oldRow {
            newRow = newRow - 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row: ASRow = rows[indexPath.row];
        let result = String(row.value)
        let title = row.displayTitle
        
        
        if row is ASLimitResultRow || row is ASInputResultRow {
            let cell = tableView.dequeueReusableCellWithIdentifier("ResultTableViewCellIdentifier", forIndexPath: indexPath) as! ResultTableViewCell
            
            cell.resultValue.text = result
            cell.displayTitleLabel.text = title
            
            return cell
        } else if row is ASChoicesRow {
            let cell: MultiChoiceTableViewCell = tableView.dequeueReusableCellWithIdentifier("MultiChoiceTableViewCellIdentifier", forIndexPath: indexPath) as! MultiChoiceTableViewCell
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.displayTitleLabel.text = title
            let rowMultiChoices: [String] = (row as! ASChoicesRow).multiChoices
            
            for i in 0...(cell.multiSelect.numberOfSegments - 1) {
                cell.multiSelect.setTitle(rowMultiChoices[i], forSegmentAtIndex: i)
            }
            
            var i = cell.multiSelect.numberOfSegments
            while cell.multiSelect.numberOfSegments < rowMultiChoices.count {
                cell.multiSelect.insertSegmentWithTitle(rowMultiChoices[i], atIndex: i, animated: false)
                i += 1
            }

            cell.contentView.bringSubviewToFront(cell.multiSelect)
            
            cell.delegate = row as! ASChoicesRow
            
            return cell
        } else if row is ASLimitRow {
            let cell: LimitPickerTableViewCell = tableView.dequeueReusableCellWithIdentifier("LimitPickerTableViewCellIdentifier", forIndexPath: indexPath) as! LimitPickerTableViewCell
            let prevRow: ASLimitResultRow = rows[indexPath.row - 1] as! ASLimitResultRow
            
            cell.delegate = prevRow
            
            NSNotificationCenter.defaultCenter().addObserverForName("limitPickerDidChange", object: nil, queue: nil) {(notification: NSNotification) -> Void in
                tableView.reloadData()
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.upperLimit = (row as! ASLimitRow).upperLimit
            cell.lowerLimit = (row as! ASLimitRow).lowerLimit
            cell.LimitPicker.reloadAllComponents()

            return cell
            
        } else if row is ASInputRow {
            let cell: NumberInputTableViewCell = tableView.dequeueReusableCellWithIdentifier("NumberInputTableViewCellIdentifier", forIndexPath: indexPath) as! NumberInputTableViewCell
            let prevRow: ASInputResultRow = rows[indexPath.row - 1] as! ASInputResultRow
            
            cell.delegate = prevRow
            
            NSNotificationCenter.defaultCenter().addObserverForName(" ", object: nil, queue: nil) {(notification: NSNotification) -> Void in
                tableView.reloadData()
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None

            return cell
        } else {
            assert(row is ASDividerRow);
            let cell = tableView.dequeueReusableCellWithIdentifier("dividerCellIdentifier", forIndexPath: indexPath)
            
            cell.userInteractionEnabled = false
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return rows[indexPath.row].height
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {        
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("ASFinalTableHeaderViewIdentifier")
        let header = cell as! ASFinalTableHeaderView
        
        header.displayTitleLabel.text = "Final Score:"
        header.resultValue.text = String(player!.calculateScore())
        
        header.layer.shadowColor = UIColor.darkGrayColor().CGColor
        header.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        header.layer.shadowOpacity = 0.5
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
}
