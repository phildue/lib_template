#ifndef MYLIBRARY_MYALGORITHM_H__
#define MYLIBRARY_MYALGORITHM_H__

#include <opencv2/opencv.hpp>

namespace dnae{
namespace MyLibrary{

class MyAlgorithm
{
public:
	int compute(int i) const;

	bool detector(const cv::Mat &) const;
};

}}
#endif //MYLIBRARY_MYALGORITHM_H__
