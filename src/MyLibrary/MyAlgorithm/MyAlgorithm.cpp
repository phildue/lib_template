#include "MyAlgorithm.h"

namespace dnae{
namespace MyLibrary{

int MyAlgorithm::compute(int i) const
{
	return i+1;
}

bool MyAlgorithm::detector(const cv::Mat &) const {
    return false;
}

}
}
