//
//  WriteViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import RealmSwift
import SECoreTextView

enum State: Int{
    case write = 0
    case view
}
class WriteViewController: UIViewController, WriteCellDelegate {
    

    // MARK:- IBOutlets

    @IBOutlet var tableViewHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backGroundShadowView: UIControl!
    
    // tableViewHeaderView
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberOfCharactersLabel: UILabel!
    @IBOutlet weak var staredButton: UIButton!
    
    // navigationBar
    @IBOutlet weak var cameraAndDeleteButton: UIButton!
    @IBOutlet weak var doneAndShareButton: UIButton!
    
    // chose photo footerView
    @IBOutlet var chosePhotoFooterView: UIView!
    @IBOutlet weak var pickPhotoFromLibraryButton: UIButton!
    @IBOutlet weak var takePicktureButton: UIButton!
    
    let realm = try! Realm()
    var stared: Bool = false
    
    var state: State = State.view{
        didSet{
           
                switch state{
                case .write:
                    navigationBarChangeToStateWrite()
                case .view:
                    navigationBarChangeToStateView()
                }
        }
    }
    var stateHelper: Int = 0
    var note:Notes!
    
    var textView: SETextView?{
        if let cell = self.tableView.subviews.first?.subviews.first as? WriteCell, let textView = cell.viewWithTag(10) as? SETextView{
            return textView
        }
        return nil
    }
    
    private let kFooterViewHeight: CGFloat = 160

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if stateHelper == 0{
            self.state = State.view
        }else{
            self.state = State.write
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //saveNote()
    }
    
    // MARK: - IBAcitons
    @IBAction func listBackButtonDidPressed(sender: UIButton) {
        saveNote()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func staredButtonDidPressed(sender: UIButton) {
        stared = !stared
        if stared{
            staredButton.setImage(UIImage(named: "star_big_selected"), forState: .Normal)
        }else{
            staredButton.setImage(UIImage(named: "star_big_normal"), forState: .Normal)
        }
    }

    @IBAction func cameraAndDeleteButtonDidPressed(sender: UIButton) {
        switch state{
        case .write:
            self.textView?.resignFirstResponder()
            chosePhoto()
        case .view:
            deleteNote()
        }
    }
    
    @IBAction func doneAndShareButton(sender: UIButton) {
            switch state{
            case .view:
                break
            case .write:
                self.textView?.resignFirstResponder()
            }

    }
    
    // MARK: - chose photo footerView
    @IBAction func chosePhotoButtonDidPressed(sender: AnyObject) {
        pickMediaFromSource(.PhotoLibrary)
    }
    @IBAction func takePictureButtonDidPressed(sender: AnyObject) {
        pickMediaFromSource(.Camera)
    }
    @IBAction func giveUpToAddPhoto(sender: AnyObject) {
        backToNormalState()
    }

    @IBAction func backGroundViewTouched(sender: AnyObject) {
        backToNormalState()
    }
    func backToNormalState(){
        spring(0.4) { () -> Void in
            self.chosePhotoFooterView.transform = CGAffineTransformMakeTranslation(0, self.kFooterViewHeight)
            self.backGroundShadowView.alpha = 0
        }
        self.backGroundShadowView.hidden = true
        self.backGroundShadowView.alpha = 1
        self.chosePhotoFooterView.hidden = true
        self.chosePhotoFooterView.transform = CGAffineTransformIdentity
    }
    func chosePhoto(){
        
        self.backGroundShadowView.hidden = false
        self.chosePhotoFooterView.hidden = false
        self.chosePhotoFooterView.frame = CGRect(x: 0, y: self.view.frame.height - kFooterViewHeight, width: self.view.frame.width, height: kFooterViewHeight)
        self.view.addSubview(self.chosePhotoFooterView)
        
        if !UIImagePickerController.isSourceTypeAvailable(.Camera){
            self.takePicktureButton.enabled = false
        }
        
        // animation
        self.chosePhotoFooterView.transform = CGAffineTransformMakeTranslation(0, kFooterViewHeight)
        spring(0.6) { () -> Void in
            self.chosePhotoFooterView.transform = CGAffineTransformIdentity
        }
    }
    
    func pickMediaFromSource(sourceType: UIImagePickerControllerSourceType){
        let mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(sourceType)!
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes.count > 0{
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            presentViewController(picker, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(
                title:"Error accessing media", message: "Unsupported media source.",
                preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func deleteNote(){
        
    }
    // MARK: - statusBar
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // 
    func saveNote(){
        switch state{
        case .view:
            updateNoteInRealmDataBase()
        case .write:
            addNewNoteIntoRealmDataBase()
        }
    }
    
    func updateNoteInRealmDataBase(){
        var updatedNote = Notes()
        updatedNote.contents = (self.textView?.text)!
        updatedNote.stared = stared
        updatedNote.created = self.note.created

    }
    func addNewNoteIntoRealmDataBase(){
        try! realm.write({ () -> Void in
            self.note = Notes(stared: stared, created: NSDate(), contents: (self.textView?.text)!, hasPhoto: false)
            realm.add(self.note)
        })
    }
    func setUpUI(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.tableView.backgroundColor = UIColor.clearColor()
        self.timeLabel.text = "        \(NSDate().description)"
        
        self.tableView.estimatedRowHeight = 500
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    func navigationBarChangeToStateView(){
        self.cameraAndDeleteButton.setImage(UIImage(named: "btn_delete"), forState: .Normal)
        self.cameraAndDeleteButton.setBackgroundImage(UIImage(named: "btn_red_bg_n"), forState: .Normal)
        self.doneAndShareButton.setImage(UIImage(named: "btn_send"), forState: .Normal)
    }
    func navigationBarChangeToStateWrite(){
        
        self.cameraAndDeleteButton.setImage(UIImage(named: "btn_camera"), forState: .Normal)
        self.cameraAndDeleteButton.setBackgroundImage(UIImage(named: "btn_bg_n"), forState: .Normal)
        self.doneAndShareButton.setImage(UIImage(named: "btn_done"), forState: .Normal)
    }
    
    // MARK: - WriteCellDelegate
    func stateBecomeWrite() {
        self.state = State.write
    }
    func stateBecomeView() {
        self.state = State.view
    }
    

}

// MARK: - UINavigationControllerDelegate-UIImagePickerControllerDelegate

extension WriteViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    // if you want to become UIImagePickerController's delegat, you must conform the two above protocol at the same time
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        backToNormalState()
    }
}
