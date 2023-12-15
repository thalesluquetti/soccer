//
//  UITableView+Reusable.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 15/12/23.
//

import UIKit.UITableView

//Extension para agilizar o registro e reuso de celulas
extension UITableView {
    final func register<C: UITableViewCell>(cell: C.Type) where C: ReusableView {
        let bundle = Bundle(for: cell.self)
        if bundle.path(forResource: cell.identifier, ofType: "nib") != nil {
            register(cell.nib(bundle: bundle), forCellReuseIdentifier: cell.identifier)
        } else {
            register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }

    final func dequeueReusableCell<C: UITableViewCell>(type cellType: C.Type = C.self) -> C
        where C: ReusableView
    {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier) as? C else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.identifier) matching type \(cellType.self). "
            )
        }

        return cell
    }
}
