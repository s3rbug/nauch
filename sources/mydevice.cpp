#include "mydevice.h"


MyDevice::MyDevice(QObject *parent) : QObject(parent)
{
    m_screen = qApp->primaryScreen();
    m_dpi = m_screen->physicalDotsPerInch() * m_screen->devicePixelRatio();
    m_isMobile = false;

    m_dpi = m_screen->logicalDotsPerInch() * m_screen->devicePixelRatio();
    m_dp = m_dpi / 160.f;
    #if defined(Q_OS_ANDROID)
    m_dp = 1;
    #endif
    emit dpChanged(m_dp);
    emit isMobileChanged(m_isMobile);
}

MyDevice::~MyDevice()
{
}



