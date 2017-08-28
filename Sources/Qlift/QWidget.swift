import CQlift


open class QWidget: QObject {
    public var windowTitle: String {
        get {
            return String(cString: QWidget_windowTitle(self.ptr))
        }
        set(newWindowTitle) {
            QWidget_setWindowTitle(self.ptr, newWindowTitle)
        }
    }

    public var geometry: QRect? {
        get {
            return QRect(ptr: QWidget_geometry(self.ptr))
        }
        set(newGeometry) {
            QWidget_setGeometry(self.ptr, newGeometry?.ptr)
        }
    }

    public var enabled: Bool {
        get {
            return QWidget_isEnabled(self.ptr)
        }
        set(newEnabled) {
            QWidget_setEnabled(self.ptr, newEnabled)
        }
    }

    public var height: Int32 {
        get {
            return QWidget_height(self.ptr)
        }
    }

    public var width: Int32 {
        get {
            return QWidget_width(self.ptr)
        }
    }

    public var pos: QPoint {
        get {
            return QPoint(ptr: QWidget_pos(self.ptr))
        }
    }

    public var window: QWidget {
        get {
            return QWidget(ptr: QWidget_window(self.ptr))
        }
    }

    public var rect: QRect {
        get {
            return QRect(ptr: QWidget_rect(self.ptr))
        }
    }

    public var frameGeometry: QRect {
        get {
            return QRect(ptr: QWidget_frameGeometry(self.ptr))
        }
    }

    public init(parent: QWidget? = nil, flags: Qt.WindowFlags = .Widget) {
        super.init(ptr: QWidget_new(parent?.ptr, flags.rawValue), parent: parent)
    }

    public init(ptr: UnsafeMutableRawPointer, parent: QWidget? = nil) {
        super.init(ptr: ptr, parent: parent)
    }

    public func add(action: QAction) {
        QWidget_addAction(self.ptr, action.ptr)
    }

    deinit {
        if self.ptr != nil {
            if QObject_parent(self.ptr) == nil {
                QWidget_delete(self.ptr)
            }
            self.ptr = nil
        }
    }

    public func move(to: QPoint) {
        QWidget_move(self.ptr, to.ptr)
    }

    open func close() -> Bool {
        return QWidget_close(self.ptr)
    }

    open func show() {
        QWidget_show(self.ptr)
    }
}

